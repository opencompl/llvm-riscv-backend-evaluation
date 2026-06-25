"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i32):
        %48 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %49 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %50 = "riscv.div"(%48, %49) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %46 = "riscv.slt"(%45, %50) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %47 = "builtin.unrealized_conversion_cast"(%46) : (!riscv.reg) -> i1
        %40 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %42 = "riscv.sra"(%40, %50) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i32) -> !riscv.reg
        %38 = "riscv.sext.w"(%37) : (!riscv.reg) -> !riscv.reg
        %35 = "riscv.rem"(%42, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%47) : (i1) -> !riscv.reg
        %29 = "riscv.czero.eqz"(%50, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.czero.nez"(%35, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "riscv.or"(%29, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %24 = "riscv.rem"(%22, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.sra"(%31, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
