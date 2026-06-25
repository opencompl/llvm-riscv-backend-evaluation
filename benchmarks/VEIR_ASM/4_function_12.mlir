"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64):
        %26 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%26) : (!riscv.reg) -> i32
        %23 = "builtin.unrealized_conversion_cast"(%27) : (i32) -> !riscv.reg
        %24 = "riscv.sext.w"(%23) : (!riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %21 = "riscv.and"(%20, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "riscv.sltu"(%21, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "riscv.xori"(%16) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%17) : (!riscv.reg) -> i1
        "func.return"(%18) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
