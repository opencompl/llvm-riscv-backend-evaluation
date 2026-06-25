"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i32):
        %19 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %20 = "riscv.zext.w"(%19) : (!riscv.reg) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %17 = "riscv.or"(%20, %15) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %14 = "builtin.unrealized_conversion_cast"(%17) : (!riscv.reg) -> i1
        "func.return"(%14) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
