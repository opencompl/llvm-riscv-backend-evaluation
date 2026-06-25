"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i32, %arg6_2 : i64):
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %23 = "riscv.zext.w"(%22) : (!riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %18 = "riscv.czero.eqz"(%23, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.czero.nez"(%16, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.or"(%18, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %14 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i32
        "func.return"(%14) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
