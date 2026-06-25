"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i32, %arg6_3 : i1):
        %50 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %51 = "riscv.sext.w"(%50) : (!riscv.reg) -> !riscv.reg
        %46 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %48 = "riscv.sra"(%46, %51) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %44 = "riscv.divu"(%42, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "riscv.remu"(%44, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i1) -> !riscv.reg
        %34 = "riscv.czero.eqz"(%31, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "riscv.czero.nez"(%32, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.or"(%34, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.srl"(%36, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.remu"(%40, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.sltu"(%25, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.xori"(%20) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i1
        "func.return"(%22) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
