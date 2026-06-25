"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %24 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%24) : (!riscv.reg) -> i1
        %20 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %22 = "riscv.or"(%21, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %13 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%25) : (i1) -> !riscv.reg
        %16 = "riscv.czero.eqz"(%13, %15) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "riscv.czero.nez"(%22, %15) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.or"(%16, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i64
        "func.return"(%19) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
