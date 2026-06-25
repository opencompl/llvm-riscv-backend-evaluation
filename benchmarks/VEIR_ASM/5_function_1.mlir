"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32):
        %28 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %29 = "riscv.zext.w"(%28) : (!riscv.reg) -> !riscv.reg
        %26 = "riscv.sra"(%29, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %22 = "riscv.zext.w"(%21) : (!riscv.reg) -> !riscv.reg
        %19 = "riscv.remu"(%26, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i1
        "func.return"(%16) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
