"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i1):
        %47 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %48 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %49 = "riscv.remu"(%47, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i1) -> !riscv.reg
        %43 = "riscv.czero.eqz"(%40, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %44 = "riscv.czero.nez"(%41, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %45 = "riscv.or"(%43, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "riscv.slt"(%45, %49) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%38) : (!riscv.reg) -> i1
        %32 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %34 = "riscv.or"(%33, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%39) : (i1) -> !riscv.reg
        %28 = "riscv.czero.eqz"(%34, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.czero.nez"(%49, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.or"(%28, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%30) : (!riscv.reg) -> i32
        %20 = "builtin.unrealized_conversion_cast"(%24) : (i32) -> !riscv.reg
        %21 = "riscv.sext.w"(%20) : (!riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
