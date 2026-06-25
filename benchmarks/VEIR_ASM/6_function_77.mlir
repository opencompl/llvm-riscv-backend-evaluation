"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %31 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %33 = "riscv.srl"(%31, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%29) : (!riscv.reg) -> i32
        %26 = "builtin.unrealized_conversion_cast"(%30) : (i32) -> !riscv.reg
        %27 = "riscv.sext.w"(%26) : (!riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %24 = "riscv.divu"(%22, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.sra"(%33, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i32
        "func.return"(%17) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
