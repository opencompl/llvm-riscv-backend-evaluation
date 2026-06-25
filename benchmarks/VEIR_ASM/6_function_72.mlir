"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %36 = "riscv.xor"(%35, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "riscv.div"(%30, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %28 = "riscv.divu"(%26, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.div"(%36, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.rem"(%24, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%17) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
