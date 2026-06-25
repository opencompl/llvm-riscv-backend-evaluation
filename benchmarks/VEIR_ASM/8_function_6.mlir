"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i1):
        %49 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %50 = "riscv.zext.w"(%49) : (!riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i1) -> !riscv.reg
        %45 = "riscv.czero.eqz"(%42, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %46 = "riscv.czero.nez"(%50, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %47 = "riscv.or"(%45, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %40 = "riscv.or"(%47, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.rem"(%40, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.xor"(%36, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.divu"(%32, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %24 = "riscv.rem"(%22, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.sra"(%50, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
