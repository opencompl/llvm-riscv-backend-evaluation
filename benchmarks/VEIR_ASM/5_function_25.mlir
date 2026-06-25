"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i1, %arg6_2 : i64):
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "riscv.div"(%34, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %30 = "riscv.czero.eqz"(%27, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "riscv.czero.nez"(%28, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.or"(%30, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.remu"(%36, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %21 = "riscv.and"(%20, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "riscv.or"(%21, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%17) : (!riscv.reg) -> i64
        "func.return"(%18) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
