"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %34 = "riscv.or"(%33, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %30 = "riscv.slt"(%34, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%30) : (!riscv.reg) -> i1
        %21 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%31) : (i1) -> !riscv.reg
        %24 = "riscv.czero.eqz"(%21, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.czero.nez"(%22, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.or"(%24, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %19 = "riscv.div"(%26, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i32
        "func.return"(%16) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
