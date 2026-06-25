"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %45 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %46 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %47 = "riscv.slt"(%45, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %48 = "builtin.unrealized_conversion_cast"(%47) : (!riscv.reg) -> i1
        %38 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%48) : (i1) -> !riscv.reg
        %41 = "riscv.czero.eqz"(%38, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "riscv.czero.nez"(%39, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %43 = "riscv.or"(%41, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "riscv.rem"(%43, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.and"(%36, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%32) : (!riscv.reg) -> i1
        %24 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %26 = "riscv.xor"(%25, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%29) : (i1) -> !riscv.reg
        %20 = "riscv.czero.eqz"(%32, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.czero.nez"(%26, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.or"(%20, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i64
        "func.return"(%23) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
