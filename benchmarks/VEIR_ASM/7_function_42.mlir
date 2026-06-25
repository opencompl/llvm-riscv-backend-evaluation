"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %38 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "riscv.xor"(%39, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %36 = "riscv.sra"(%34, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.sra"(%40, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %28 = "riscv.xor"(%27, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.sra"(%32, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%24) : (!riscv.reg) -> i32
        %17 = "builtin.unrealized_conversion_cast"(%21) : (i32) -> !riscv.reg
        %18 = "riscv.zext.w"(%17) : (!riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i64
        "func.return"(%19) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
