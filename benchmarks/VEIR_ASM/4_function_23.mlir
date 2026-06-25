"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i32, %arg6_2 : i64):
        %25 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %26 = "riscv.sext.w"(%25) : (!riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %23 = "riscv.zext.w"(%22) : (!riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %20 = "riscv.or"(%19, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "riscv.remu"(%26, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%16) : (!riscv.reg) -> i64
        "func.return"(%17) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
