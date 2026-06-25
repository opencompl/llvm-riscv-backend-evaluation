"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i1, %arg6_2 : i64):
        %29 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %31 = "riscv.srl"(%29, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %25 = "riscv.czero.eqz"(%22, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.czero.nez"(%31, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.or"(%25, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.divu"(%27, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %14 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %16 = "riscv.rem"(%14, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%16) : (!riscv.reg) -> i64
        "func.return"(%17) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
