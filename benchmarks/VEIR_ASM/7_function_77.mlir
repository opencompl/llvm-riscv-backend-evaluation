"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i1):
        %44 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %46 = "riscv.div"(%44, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %42 = "riscv.sra"(%46, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %38 = "riscv.xor"(%37, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %34 = "riscv.and"(%33, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i1) -> !riscv.reg
        %28 = "riscv.czero.eqz"(%42, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.czero.nez"(%34, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.or"(%28, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.divu"(%30, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.divu"(%34, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
