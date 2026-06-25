"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %29 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %31 = "riscv.divu"(%29, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %27 = "riscv.or"(%26, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %23 = "riscv.remu"(%27, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %19 = "riscv.or"(%23, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i1
        "func.return"(%16) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
