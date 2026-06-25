"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%35) : (!riscv.reg) -> i32
        %32 = "builtin.unrealized_conversion_cast"(%36) : (i32) -> !riscv.reg
        %33 = "riscv.sext.w"(%32) : (!riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%36) : (i32) -> !riscv.reg
        %30 = "riscv.zext.w"(%29) : (!riscv.reg) -> !riscv.reg
        %27 = "riscv.div"(%33, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.sra"(%27, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %18 = "riscv.sltu"(%23, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.xori"(%18) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i1
        "func.return"(%20) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
