"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %41 = "riscv.divu"(%39, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "riscv.xor"(%41, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.divu"(%41, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.remu"(%33, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %25 = "riscv.divu"(%23, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.sra"(%25, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
