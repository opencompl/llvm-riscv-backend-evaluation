"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %36 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %38 = "riscv.sra"(%36, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "riscv.div"(%32, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %30 = "riscv.rem"(%28, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%30) : (!riscv.reg) -> i32
        %23 = "builtin.unrealized_conversion_cast"(%27) : (i32) -> !riscv.reg
        %24 = "riscv.zext.w"(%23) : (!riscv.reg) -> !riscv.reg
        %21 = "riscv.xor"(%24, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i1
        "func.return"(%18) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
