"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i1):
        %48 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %49 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %50 = "riscv.or"(%49, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i1) -> !riscv.reg
        %44 = "riscv.czero.eqz"(%41, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %45 = "riscv.czero.nez"(%42, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %46 = "riscv.or"(%44, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i1) -> !riscv.reg
        %37 = "riscv.czero.eqz"(%46, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "riscv.czero.nez"(%35, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.or"(%37, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.divu"(%39, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %28 = "riscv.xor"(%32, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %24 = "riscv.divu"(%22, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.sltu"(%50, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.xori"(%19) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
