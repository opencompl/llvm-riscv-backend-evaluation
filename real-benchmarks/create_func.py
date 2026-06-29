import sys

from xdsl.rewriter import Rewriter
from xdsl.xdsl_opt_main import xDSLOptMain
from xdsl.rewriter import InsertPoint
from xdsl.ir import Block

from xdsl.dialects.builtin import ModuleOp, FunctionType, i64
from xdsl.dialects import llvm, func


class MyOptMain(xDSLOptMain):
    def process_module(self, module: ModuleOp):
        last_op = module.body.block.ops.last

        # VEIR output already has a func.func — nothing to wrap
        if isinstance(last_op, func.FuncOp):
            return

        module_args_types = module.body.block.arg_types
        return_op = last_op
        assert isinstance(return_op, llvm.ReturnOp)

        new_operands = list(return_op.operands)
        for idx, operand in enumerate(return_op.operands):
            if operand.type != i64:
                zext_op = llvm.ZExtOp(operand, i64)
                Rewriter().insert_op(zext_op, InsertPoint.before(return_op))
                new_operands[idx] = zext_op.result

        return_op_types = [op.type for op in new_operands]

        new_region = Rewriter().move_region_contents_to_new_regions(module.body)
        func_type = FunctionType.from_lists(module_args_types, return_op_types)
        new_func = func.FuncOp("main", func_type)
        module.body.add_block(Block())
        Rewriter().insert_op(new_func, InsertPoint.at_end(module.body.block))
        new_func.regions = [new_region]

        Rewriter().replace_op(return_op, func.ReturnOp(*new_operands))

    def run(self):
        chunks, file_extension = self.prepare_input()
        output_stream = self.prepare_output()

        try:
            for i, (chunk, offset) in enumerate(chunks):
                try:
                    if i > 0:
                        output_stream.write("// -----\n")
                    module = self.parse_chunk(chunk, file_extension, offset)

                    if module is not None:
                        self.process_module(module)
                        output_stream.write(self.output_resulting_program(module))
                    output_stream.flush()
                finally:
                    chunk.close()
        finally:
            if output_stream is not sys.stdout:
                output_stream.close()

        exit(0)


def main():
    MyOptMain().run()


if "__main__" == __name__:
    main()
