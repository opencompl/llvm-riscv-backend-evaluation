"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i64):
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %36 = "riscv.zext.w"(%35) : (!riscv.reg) -> !riscv.reg
        %33 = "riscv.and"(%36, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%29) : (!riscv.reg) -> i32
        %26 = "builtin.unrealized_conversion_cast"(%30) : (i32) -> !riscv.reg
        %27 = "riscv.sext.w"(%26) : (!riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%27) : (!riscv.reg) -> i32
        %21 = "builtin.unrealized_conversion_cast"(%25) : (i32) -> !riscv.reg
        %22 = "riscv.sext.w"(%21) : (!riscv.reg) -> !riscv.reg
        %19 = "riscv.or"(%22, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
