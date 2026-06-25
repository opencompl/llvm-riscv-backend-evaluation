"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %45 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %46 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %47 = "riscv.remu"(%45, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %43 = "riscv.remu"(%47, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.srl"(%43, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%35) : (!riscv.reg) -> i1
        %30 = "builtin.unrealized_conversion_cast"(%36) : (i1) -> !riscv.reg
        %31 = "riscv.czero.eqz"(%39, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.czero.nez"(%43, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.or"(%31, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.remu"(%39, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.and"(%26, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i1
        "func.return"(%19) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
