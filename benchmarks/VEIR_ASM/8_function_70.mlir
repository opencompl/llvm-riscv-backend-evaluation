"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i1, %arg6_2 : i32):
        %54 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %55 = "riscv.sext.w"(%54) : (!riscv.reg) -> !riscv.reg
        %50 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %51 = "riscv.xor"(%50, %55) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %52 = "riscv.sltiu"(%51) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %53 = "builtin.unrealized_conversion_cast"(%52) : (!riscv.reg) -> i1
        %42 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %45 = "riscv.czero.eqz"(%42, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %46 = "riscv.czero.nez"(%43, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %47 = "riscv.or"(%45, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%53) : (i1) -> !riscv.reg
        %38 = "riscv.czero.eqz"(%55, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.czero.nez"(%47, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "riscv.or"(%38, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %33 = "riscv.srl"(%31, %55) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %27 = "riscv.czero.eqz"(%40, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.czero.nez"(%33, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.or"(%27, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %22 = "riscv.srl"(%20, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i1
        "func.return"(%19) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
