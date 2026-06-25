"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %37 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %40 = "riscv.czero.eqz"(%37, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "riscv.czero.nez"(%38, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "riscv.or"(%40, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %35 = "riscv.rem"(%42, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %31 = "riscv.sra"(%29, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.slt"(%35, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%27) : (!riscv.reg) -> i1
        %19 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%28) : (i1) -> !riscv.reg
        %21 = "riscv.czero.eqz"(%31, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.czero.nez"(%19, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.or"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%23) : (!riscv.reg) -> i32
        "func.return"(%17) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
