"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i1):
        %49 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %50 = "riscv.sext.w"(%49) : (!riscv.reg) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %47 = "riscv.and"(%50, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %43 = "riscv.remu"(%50, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i1) -> !riscv.reg
        %37 = "riscv.czero.eqz"(%47, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "riscv.czero.nez"(%43, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.or"(%37, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %32 = "riscv.and"(%39, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.and"(%32, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %24 = "riscv.remu"(%22, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.or"(%24, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
