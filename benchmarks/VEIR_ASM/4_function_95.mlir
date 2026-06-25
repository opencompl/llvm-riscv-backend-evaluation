"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i64, %arg6_2 : i64):
        %27 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %28 = "riscv.sext.w"(%27) : (!riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %25 = "riscv.remu"(%23, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.and"(%25, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "riscv.sltu"(%25, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "riscv.xori"(%16) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%17) : (!riscv.reg) -> i1
        "func.return"(%18) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
