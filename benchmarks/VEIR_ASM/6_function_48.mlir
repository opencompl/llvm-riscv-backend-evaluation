"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i1, %arg6_2 : i64):
        %43 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %45 = "riscv.rem"(%43, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %39 = "riscv.czero.eqz"(%45, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "riscv.czero.nez"(%45, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "riscv.or"(%39, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %34 = "riscv.rem"(%32, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %28 = "riscv.czero.eqz"(%41, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.czero.nez"(%34, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.or"(%28, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%30) : (!riscv.reg) -> i1
        %18 = "builtin.unrealized_conversion_cast"(%24) : (i1) -> !riscv.reg
        %19 = "riscv.czero.eqz"(%41, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.czero.nez"(%30, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.or"(%19, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i64
        "func.return"(%22) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
