"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %47 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %48 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %49 = "riscv.xor"(%48, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %50 = "riscv.sltiu"(%49) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %51 = "builtin.unrealized_conversion_cast"(%50) : (!riscv.reg) -> i1
        %43 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %45 = "riscv.divu"(%43, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%51) : (i1) -> !riscv.reg
        %39 = "riscv.czero.eqz"(%36, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "riscv.czero.nez"(%45, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "riscv.or"(%39, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %34 = "riscv.or"(%33, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %30 = "riscv.sltu"(%28, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%30) : (!riscv.reg) -> i1
        %22 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%31) : (i1) -> !riscv.reg
        %24 = "riscv.czero.eqz"(%41, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.czero.nez"(%22, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.or"(%24, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.sra"(%41, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
