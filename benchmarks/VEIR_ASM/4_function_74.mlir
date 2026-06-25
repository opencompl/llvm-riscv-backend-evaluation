"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %30 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %32 = "riscv.sltu"(%30, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%32) : (!riscv.reg) -> i1
        %23 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%33) : (i1) -> !riscv.reg
        %26 = "riscv.czero.eqz"(%23, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.czero.nez"(%24, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.or"(%26, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%28) : (!riscv.reg) -> i1
        %14 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%22) : (i1) -> !riscv.reg
        %17 = "riscv.czero.eqz"(%14, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.czero.nez"(%28, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.or"(%17, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
