"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %27 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %29 = "riscv.div"(%27, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %25 = "riscv.rem"(%29, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%25) : (!riscv.reg) -> i1
        %14 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%22) : (i1) -> !riscv.reg
        %17 = "riscv.czero.eqz"(%14, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.czero.nez"(%29, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.or"(%17, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
