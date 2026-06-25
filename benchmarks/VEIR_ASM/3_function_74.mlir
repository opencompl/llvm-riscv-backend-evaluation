"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %19 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %21 = "riscv.sra"(%19, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %17 = "riscv.sra"(%15, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %14 = "builtin.unrealized_conversion_cast"(%17) : (!riscv.reg) -> i32
        "func.return"(%14) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
