"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %49 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %50 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %51 = "riscv.sltu"(%50, %49) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %52 = "riscv.xori"(%51) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %53 = "builtin.unrealized_conversion_cast"(%52) : (!riscv.reg) -> i1
        %42 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%53) : (i1) -> !riscv.reg
        %45 = "riscv.czero.eqz"(%42, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %46 = "riscv.czero.nez"(%43, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %47 = "riscv.or"(%45, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %38 = "riscv.czero.eqz"(%35, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.czero.nez"(%47, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "riscv.or"(%38, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %33 = "riscv.or"(%32, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.remu"(%47, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.or"(%33, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.xor"(%25, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.lui"() {immediate = 0 : i20} : () -> !riscv.reg
        %21 = "riscv.sltu"(%20, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i1
        "func.return"(%22) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
