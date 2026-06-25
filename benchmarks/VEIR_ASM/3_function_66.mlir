"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i32):
        %20 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %22 = "riscv.srl"(%20, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %18 = "riscv.zext.w"(%17) : (!riscv.reg) -> !riscv.reg
        %15 = "riscv.sra"(%22, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%15) : (!riscv.reg) -> i64
        "func.return"(%16) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
