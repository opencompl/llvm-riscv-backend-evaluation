"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %31 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %33 = "riscv.xor"(%32, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %29 = "riscv.divu"(%27, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.and"(%29, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %21 = "riscv.sra"(%25, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %17 = "riscv.remu"(%15, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%17) : (!riscv.reg) -> i64
        "func.return"(%18) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
