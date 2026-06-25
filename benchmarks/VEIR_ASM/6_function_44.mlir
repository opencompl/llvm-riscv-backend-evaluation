"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %35 = "riscv.rem"(%33, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %31 = "riscv.and"(%35, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %27 = "riscv.divu"(%31, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%27) : (!riscv.reg) -> i32
        %20 = "builtin.unrealized_conversion_cast"(%24) : (i32) -> !riscv.reg
        %21 = "riscv.sext.w"(%20) : (!riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %18 = "riscv.srl"(%16, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i64
        "func.return"(%19) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
