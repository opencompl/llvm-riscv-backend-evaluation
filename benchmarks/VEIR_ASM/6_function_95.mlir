"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %31 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %33 = "riscv.remu"(%31, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %29 = "riscv.rem"(%27, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%29) : (!riscv.reg) -> i32
        %22 = "builtin.unrealized_conversion_cast"(%26) : (i32) -> !riscv.reg
        %23 = "riscv.sext.w"(%22) : (!riscv.reg) -> !riscv.reg
        %20 = "riscv.remu"(%33, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i32
        "func.return"(%17) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
