"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %24 = "riscv.rem"(%22, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %18 = "riscv.czero.eqz"(%15, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.czero.nez"(%24, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.or"(%18, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %14 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%14) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
