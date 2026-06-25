"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %40 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%40) : (!riscv.reg) -> i32
        %37 = "builtin.unrealized_conversion_cast"(%41) : (i32) -> !riscv.reg
        %38 = "riscv.zext.w"(%37) : (!riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "riscv.rem"(%33, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %31 = "riscv.divu"(%29, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.and"(%31, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%27) : (!riscv.reg) -> i32
        %20 = "builtin.unrealized_conversion_cast"(%24) : (i32) -> !riscv.reg
        %21 = "riscv.sext.w"(%20) : (!riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
