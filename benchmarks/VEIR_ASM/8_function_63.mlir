"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %51 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %52 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %53 = "riscv.rem"(%51, %52) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %47 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %48 = "riscv.sltu"(%47, %53) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %49 = "riscv.xori"(%48) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %50 = "builtin.unrealized_conversion_cast"(%49) : (!riscv.reg) -> i1
        %42 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %44 = "riscv.srl"(%42, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "riscv.div"(%53, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%50) : (i1) -> !riscv.reg
        %34 = "riscv.czero.eqz"(%31, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "riscv.czero.nez"(%40, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.or"(%34, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %29 = "riscv.remu"(%27, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.srl"(%40, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.sltu"(%25, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.xori"(%20) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i1
        "func.return"(%22) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
