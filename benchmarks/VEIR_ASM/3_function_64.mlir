"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %21 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %23 = "riscv.divu"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %19 = "riscv.sra"(%23, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %15 = "riscv.srl"(%23, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%15) : (!riscv.reg) -> i64
        "func.return"(%16) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
