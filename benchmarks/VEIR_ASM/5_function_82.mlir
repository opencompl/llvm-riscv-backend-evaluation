"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %31 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%31) : (!riscv.reg) -> i32
        %28 = "builtin.unrealized_conversion_cast"(%32) : (i32) -> !riscv.reg
        %29 = "riscv.sext.w"(%28) : (!riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %26 = "riscv.or"(%25, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %22 = "riscv.srl"(%20, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "riscv.sltu"(%26, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.xori"(%17) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i1
        "func.return"(%19) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
