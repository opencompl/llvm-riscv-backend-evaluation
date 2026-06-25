"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %35 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%35) : (!riscv.reg) -> i32
        %32 = "builtin.unrealized_conversion_cast"(%36) : (i32) -> !riscv.reg
        %33 = "riscv.sext.w"(%32) : (!riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%33) : (!riscv.reg) -> i32
        %27 = "builtin.unrealized_conversion_cast"(%31) : (i32) -> !riscv.reg
        %28 = "riscv.sext.w"(%27) : (!riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %25 = "riscv.sra"(%23, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %21 = "riscv.or"(%25, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
