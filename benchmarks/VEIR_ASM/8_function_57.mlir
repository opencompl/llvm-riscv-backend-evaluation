"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %52 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %53 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %54 = "riscv.and"(%53, %52) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %48 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %50 = "riscv.and"(%54, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %46 = "riscv.slt"(%44, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %47 = "builtin.unrealized_conversion_cast"(%46) : (!riscv.reg) -> i1
        %39 = "builtin.unrealized_conversion_cast"(%47) : (i1) -> !riscv.reg
        %40 = "riscv.czero.eqz"(%54, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "riscv.czero.nez"(%54, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "riscv.or"(%40, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "riscv.sltu"(%50, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%35) : (!riscv.reg) -> i1
        %26 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%36) : (i1) -> !riscv.reg
        %29 = "riscv.czero.eqz"(%26, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.czero.nez"(%42, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "riscv.or"(%29, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.or"(%31, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.slt"(%24, %50) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
