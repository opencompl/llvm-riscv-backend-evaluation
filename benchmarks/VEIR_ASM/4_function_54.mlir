"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %24 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %26 = "riscv.remu"(%24, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %22 = "riscv.divu"(%20, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %18 = "riscv.remu"(%16, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i1
        "func.return"(%15) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
