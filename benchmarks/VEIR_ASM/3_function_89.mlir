"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %18 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %21 = "riscv.czero.eqz"(%18, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.czero.nez"(%19, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.or"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%23) : (!riscv.reg) -> i32
        %13 = "builtin.unrealized_conversion_cast"(%17) : (i32) -> !riscv.reg
        %14 = "riscv.zext.w"(%13) : (!riscv.reg) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%14) : (!riscv.reg) -> i64
        "func.return"(%15) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
