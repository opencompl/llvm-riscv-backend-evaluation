"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %24 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %26 = "riscv.or"(%25, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.srl"(%26, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %18 = "riscv.remu"(%22, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i1
        "func.return"(%15) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
