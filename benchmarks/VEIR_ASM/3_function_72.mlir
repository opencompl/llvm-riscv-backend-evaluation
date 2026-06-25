"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i32):
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %23 = "riscv.zext.w"(%22) : (!riscv.reg) -> !riscv.reg
        %20 = "riscv.xor"(%23, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %13 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %15 = "riscv.slt"(%20, %13) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "riscv.xori"(%15) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%16) : (!riscv.reg) -> i1
        "func.return"(%17) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
