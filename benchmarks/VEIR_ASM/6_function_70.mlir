"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i1, %arg6_2 : i64):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %41 = "riscv.remu"(%39, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "riscv.remu"(%41, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %31 = "riscv.czero.eqz"(%28, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.czero.nez"(%29, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.or"(%31, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.sra"(%37, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %22 = "riscv.remu"(%33, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.and"(%22, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i64
        "func.return"(%19) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
