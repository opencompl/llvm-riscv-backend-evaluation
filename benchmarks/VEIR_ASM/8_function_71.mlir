"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %51 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %52 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %53 = "riscv.or"(%52, %51) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %48 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %49 = "riscv.slt"(%48, %53) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %50 = "builtin.unrealized_conversion_cast"(%49) : (!riscv.reg) -> i1
        %41 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%50) : (i1) -> !riscv.reg
        %43 = "riscv.czero.eqz"(%53, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %44 = "riscv.czero.nez"(%41, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %45 = "riscv.or"(%43, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%45) : (!riscv.reg) -> i1
        %37 = "builtin.unrealized_conversion_cast"(%45) : (!riscv.reg) -> i1
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "riscv.srl"(%32, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%37) : (i1) -> !riscv.reg
        %28 = "riscv.czero.eqz"(%25, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.czero.nez"(%34, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.or"(%28, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%39) : (i1) -> !riscv.reg
        %21 = "riscv.czero.eqz"(%45, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.czero.nez"(%30, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.or"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%23) : (!riscv.reg) -> i64
        "func.return"(%24) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
