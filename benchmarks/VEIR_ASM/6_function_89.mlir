"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64):
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%33) : (!riscv.reg) -> i32
        %30 = "builtin.unrealized_conversion_cast"(%34) : (i32) -> !riscv.reg
        %31 = "riscv.zext.w"(%30) : (!riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %28 = "riscv.rem"(%26, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.and"(%28, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.divu"(%24, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i32
        "func.return"(%17) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
