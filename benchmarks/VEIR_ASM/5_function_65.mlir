"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64):
        %27 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%27) : (!riscv.reg) -> i32
        %24 = "builtin.unrealized_conversion_cast"(%28) : (i32) -> !riscv.reg
        %25 = "riscv.zext.w"(%24) : (!riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %22 = "riscv.rem"(%20, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i32
        %15 = "builtin.unrealized_conversion_cast"(%19) : (i32) -> !riscv.reg
        %16 = "riscv.sext.w"(%15) : (!riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%16) : (!riscv.reg) -> i64
        "func.return"(%17) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
