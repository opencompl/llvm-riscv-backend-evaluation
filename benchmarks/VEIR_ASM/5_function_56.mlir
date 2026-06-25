"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %28 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%28) : (!riscv.reg) -> i32
        %25 = "builtin.unrealized_conversion_cast"(%29) : (i32) -> !riscv.reg
        %26 = "riscv.sext.w"(%25) : (!riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %23 = "riscv.div"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.divu"(%26, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i32
        "func.return"(%16) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
