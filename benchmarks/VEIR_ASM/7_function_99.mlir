"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %41 = "riscv.div"(%39, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %37 = "riscv.and"(%36, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.div"(%41, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%33) : (!riscv.reg) -> i1
        %28 = "builtin.unrealized_conversion_cast"(%41) : (!riscv.reg) -> i32
        %24 = "builtin.unrealized_conversion_cast"(%28) : (i32) -> !riscv.reg
        %25 = "riscv.sext.w"(%24) : (!riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%30) : (i1) -> !riscv.reg
        %20 = "riscv.czero.eqz"(%17, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.czero.nez"(%25, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.or"(%20, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i64
        "func.return"(%23) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
