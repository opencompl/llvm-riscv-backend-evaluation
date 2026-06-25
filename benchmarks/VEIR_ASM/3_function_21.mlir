"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64):
        %21 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i32
        %18 = "builtin.unrealized_conversion_cast"(%22) : (i32) -> !riscv.reg
        %19 = "riscv.sext.w"(%18) : (!riscv.reg) -> !riscv.reg
        %13 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %15 = "riscv.xor"(%19, %13) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "riscv.sltiu"(%15) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%16) : (!riscv.reg) -> i1
        "func.return"(%17) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
