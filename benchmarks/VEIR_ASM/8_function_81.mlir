"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %49 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %50 = "builtin.unrealized_conversion_cast"(%49) : (!riscv.reg) -> i1
        %42 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%50) : (i1) -> !riscv.reg
        %45 = "riscv.czero.eqz"(%42, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %46 = "riscv.czero.nez"(%43, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %47 = "riscv.or"(%45, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %40 = "riscv.div"(%38, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.sra"(%47, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.and"(%47, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %28 = "riscv.div"(%32, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.div"(%36, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.sra"(%32, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
