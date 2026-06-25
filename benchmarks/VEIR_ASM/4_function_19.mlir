"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %21 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %23 = "riscv.divu"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%23) : (!riscv.reg) -> i32
        %16 = "builtin.unrealized_conversion_cast"(%20) : (i32) -> !riscv.reg
        %17 = "riscv.zext.w"(%16) : (!riscv.reg) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%17) : (!riscv.reg) -> i32
        "func.return"(%15) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
