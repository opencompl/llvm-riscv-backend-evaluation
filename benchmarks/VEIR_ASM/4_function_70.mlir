"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i32):
        %25 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %27 = "riscv.divu"(%25, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %23 = "riscv.sra"(%27, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %19 = "riscv.zext.w"(%18) : (!riscv.reg) -> !riscv.reg
        %16 = "riscv.xor"(%19, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%16) : (!riscv.reg) -> i64
        "func.return"(%17) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
