"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %49 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %50 = "builtin.unrealized_conversion_cast"(%49) : (!riscv.reg) -> i32
        %46 = "builtin.unrealized_conversion_cast"(%50) : (i32) -> !riscv.reg
        %47 = "riscv.zext.w"(%46) : (!riscv.reg) -> !riscv.reg
        %43 = "riscv.sltu"(%47, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %44 = "riscv.xori"(%43) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%44) : (!riscv.reg) -> i1
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%45) : (i1) -> !riscv.reg
        %37 = "riscv.czero.eqz"(%34, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "riscv.czero.nez"(%35, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.or"(%37, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %32 = "riscv.or"(%39, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %28 = "riscv.sra"(%26, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %24 = "riscv.or"(%28, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.sra"(%32, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
