"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "riscv.rem"(%33, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %31 = "riscv.sra"(%35, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%31) : (!riscv.reg) -> i32
        %24 = "builtin.unrealized_conversion_cast"(%28) : (i32) -> !riscv.reg
        %25 = "riscv.zext.w"(%24) : (!riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %22 = "riscv.divu"(%31, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.srl"(%25, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i64
        "func.return"(%19) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
