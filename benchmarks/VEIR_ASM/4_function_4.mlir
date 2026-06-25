"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i32):
        %23 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %25 = "riscv.or"(%24, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %21 = "riscv.zext.w"(%20) : (!riscv.reg) -> !riscv.reg
        %18 = "riscv.xor"(%21, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i32
        "func.return"(%15) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
