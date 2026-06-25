"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i1, %arg6_2 : i64):
        %41 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %44 = "riscv.czero.eqz"(%41, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %45 = "riscv.czero.nez"(%42, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %46 = "riscv.or"(%44, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.remu"(%46, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "riscv.divu"(%33, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "riscv.sra"(%46, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %27 = "riscv.xor"(%26, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.srl"(%31, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.slt"(%35, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i1
        "func.return"(%20) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
