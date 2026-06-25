"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %50 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %51 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %52 = "riscv.divu"(%50, %51) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %46 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %48 = "riscv.or"(%52, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %44 = "riscv.xor"(%43, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%44) : (!riscv.reg) -> i1
        %37 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %38 = "riscv.srl"(%52, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.slt"(%38, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%34) : (!riscv.reg) -> i1
        %27 = "builtin.unrealized_conversion_cast"(%35) : (i1) -> !riscv.reg
        %28 = "riscv.czero.eqz"(%52, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.czero.nez"(%44, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.or"(%28, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%41) : (i1) -> !riscv.reg
        %21 = "riscv.czero.eqz"(%30, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.czero.nez"(%19, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.or"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%23) : (!riscv.reg) -> i64
        "func.return"(%24) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
