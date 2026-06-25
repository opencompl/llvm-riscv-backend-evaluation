"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64):
        %23 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%23) : (!riscv.reg) -> i32
        %20 = "builtin.unrealized_conversion_cast"(%24) : (i32) -> !riscv.reg
        %21 = "riscv.sext.w"(%20) : (!riscv.reg) -> !riscv.reg
        %13 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %16 = "riscv.czero.eqz"(%13, %15) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "riscv.czero.nez"(%21, %15) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.or"(%16, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i64
        "func.return"(%19) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
