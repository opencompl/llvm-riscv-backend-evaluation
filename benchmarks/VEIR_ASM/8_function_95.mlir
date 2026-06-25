"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %50 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %51 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %52 = "riscv.sra"(%50, %51) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %46 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %47 = "riscv.sltu"(%52, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %48 = "riscv.xori"(%47) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %49 = "builtin.unrealized_conversion_cast"(%48) : (!riscv.reg) -> i1
        %41 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %43 = "riscv.remu"(%41, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%49) : (i1) -> !riscv.reg
        %37 = "riscv.czero.eqz"(%34, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "riscv.czero.nez"(%43, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.or"(%37, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %32 = "riscv.divu"(%30, %52) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.sra"(%39, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.divu"(%39, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.sltu"(%39, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
