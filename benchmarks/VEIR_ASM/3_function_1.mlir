"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32):
        %19 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %20 = "riscv.sext.w"(%19) : (!riscv.reg) -> !riscv.reg
        %17 = "riscv.remu"(%20, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %14 = "builtin.unrealized_conversion_cast"(%17) : (!riscv.reg) -> i1
        "func.return"(%14) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
