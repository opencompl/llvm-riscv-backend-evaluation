"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i64, %arg6_2 : i64):
        %36 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %37 = "riscv.sext.w"(%36) : (!riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %34 = "riscv.divu"(%37, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%34) : (!riscv.reg) -> i32
        %27 = "builtin.unrealized_conversion_cast"(%31) : (i32) -> !riscv.reg
        %28 = "riscv.sext.w"(%27) : (!riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %25 = "riscv.xor"(%24, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.divu"(%28, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i1
        "func.return"(%18) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
