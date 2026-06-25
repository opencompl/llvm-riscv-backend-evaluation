"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %26 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %28 = "riscv.xor"(%27, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %24 = "riscv.xor"(%23, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.or"(%24, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %14 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %16 = "riscv.remu"(%14, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%16) : (!riscv.reg) -> i64
        "func.return"(%17) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
