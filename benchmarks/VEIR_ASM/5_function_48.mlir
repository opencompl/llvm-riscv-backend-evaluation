"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %29 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %31 = "riscv.xor"(%30, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %27 = "riscv.divu"(%25, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.xor"(%31, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.sra"(%27, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i1
        "func.return"(%16) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
