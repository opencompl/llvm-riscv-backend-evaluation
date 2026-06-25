"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %26 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %28 = "riscv.remu"(%26, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %24 = "riscv.srl"(%28, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%24) : (!riscv.reg) -> i32
        %17 = "builtin.unrealized_conversion_cast"(%21) : (i32) -> !riscv.reg
        %18 = "riscv.zext.w"(%17) : (!riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i1
        "func.return"(%16) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
