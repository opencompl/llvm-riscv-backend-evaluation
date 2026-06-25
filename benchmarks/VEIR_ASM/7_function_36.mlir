"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %48 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %49 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %50 = "riscv.sra"(%48, %49) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %44 = "riscv.czero.eqz"(%50, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %45 = "riscv.czero.nez"(%42, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %46 = "riscv.or"(%44, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %38 = "riscv.sltu"(%50, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.xori"(%38) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%39) : (!riscv.reg) -> i1
        %34 = "riscv.or"(%46, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%40) : (i1) -> !riscv.reg
        %28 = "riscv.czero.eqz"(%34, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.czero.nez"(%50, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.or"(%28, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.divu"(%30, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.srl"(%46, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
