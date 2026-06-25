"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %34 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %36 = "riscv.rem"(%34, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %32 = "riscv.and"(%36, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %28 = "riscv.sra"(%26, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.srl"(%28, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.divu"(%28, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%17) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
