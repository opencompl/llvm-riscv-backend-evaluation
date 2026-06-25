"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %25 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %28 = "riscv.czero.eqz"(%25, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.czero.nez"(%26, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.or"(%28, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%30) : (!riscv.reg) -> i32
        %20 = "builtin.unrealized_conversion_cast"(%24) : (i32) -> !riscv.reg
        %21 = "riscv.sext.w"(%20) : (!riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i32
        %15 = "builtin.unrealized_conversion_cast"(%19) : (i32) -> !riscv.reg
        %16 = "riscv.sext.w"(%15) : (!riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%16) : (!riscv.reg) -> i64
        "func.return"(%17) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
