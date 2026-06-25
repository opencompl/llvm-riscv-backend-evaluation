"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %37 = "riscv.xor"(%36, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %33 = "riscv.div"(%31, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%33) : (!riscv.reg) -> i1
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%30) : (i1) -> !riscv.reg
        %25 = "riscv.czero.eqz"(%22, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.czero.nez"(%37, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.or"(%25, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.divu"(%37, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%17) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
