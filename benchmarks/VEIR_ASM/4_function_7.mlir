"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %29 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %31 = "riscv.xor"(%30, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %27 = "riscv.slt"(%31, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%27) : (!riscv.reg) -> i1
        %23 = "riscv.divu"(%31, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %14 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%28) : (i1) -> !riscv.reg
        %17 = "riscv.czero.eqz"(%14, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.czero.nez"(%23, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.or"(%17, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
