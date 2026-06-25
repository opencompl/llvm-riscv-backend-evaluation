"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %44 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%44) : (!riscv.reg) -> i32
        %41 = "builtin.unrealized_conversion_cast"(%45) : (i32) -> !riscv.reg
        %42 = "riscv.sext.w"(%41) : (!riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %39 = "riscv.remu"(%42, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.sltu"(%39, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "riscv.xori"(%34) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%35) : (!riscv.reg) -> i1
        %28 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %30 = "riscv.divu"(%28, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %26 = "riscv.remu"(%30, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%36) : (i1) -> !riscv.reg
        %20 = "riscv.czero.eqz"(%17, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.czero.nez"(%26, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.or"(%20, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i64
        "func.return"(%23) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
