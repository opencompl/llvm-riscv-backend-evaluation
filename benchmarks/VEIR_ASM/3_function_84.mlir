"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %19 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %22 = "riscv.czero.eqz"(%19, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.czero.nez"(%20, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.or"(%22, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %17 = "riscv.rem"(%24, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %14 = "builtin.unrealized_conversion_cast"(%17) : (!riscv.reg) -> i32
        "func.return"(%14) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
