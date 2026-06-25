"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i32):
        %29 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %30 = "riscv.zext.w"(%29) : (!riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %27 = "riscv.srl"(%25, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %21 = "riscv.czero.eqz"(%27, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.czero.nez"(%27, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.or"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "riscv.or"(%23, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%16) : (!riscv.reg) -> i64
        "func.return"(%17) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
