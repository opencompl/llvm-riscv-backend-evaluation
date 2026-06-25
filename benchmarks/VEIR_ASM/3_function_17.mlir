"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i64, %arg6_2 : i64):
        %21 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %22 = "riscv.sext.w"(%21) : (!riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %19 = "riscv.and"(%18, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %14 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %15 = "riscv.and"(%14, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%15) : (!riscv.reg) -> i64
        "func.return"(%16) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
