"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %25 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %27 = "riscv.or"(%26, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%27) : (!riscv.reg) -> i1
        %16 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%24) : (i1) -> !riscv.reg
        %19 = "riscv.czero.eqz"(%16, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.czero.nez"(%17, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.or"(%19, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i32
        "func.return"(%15) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
