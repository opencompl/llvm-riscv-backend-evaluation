"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i1, %arg6_2 : i64):
        %44 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %46 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %47 = "riscv.czero.eqz"(%44, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %48 = "riscv.czero.nez"(%45, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %49 = "riscv.or"(%47, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %42 = "riscv.and"(%49, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "riscv.srl"(%42, %49) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.srl"(%49, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%34) : (!riscv.reg) -> i32
        %27 = "builtin.unrealized_conversion_cast"(%31) : (i32) -> !riscv.reg
        %28 = "riscv.sext.w"(%27) : (!riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %23 = "riscv.czero.eqz"(%28, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.czero.nez"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.or"(%23, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%25) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
