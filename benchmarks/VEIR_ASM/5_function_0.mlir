"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i64, %arg6_2 : i64):
        %29 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %30 = "riscv.sext.w"(%29) : (!riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %27 = "riscv.remu"(%30, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.div"(%30, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %19 = "riscv.remu"(%23, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i32
        "func.return"(%16) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
