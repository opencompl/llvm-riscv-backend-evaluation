"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %41 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %43 = "riscv.slt"(%41, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %44 = "riscv.xori"(%43) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%44) : (!riscv.reg) -> i1
        %37 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %39 = "riscv.sra"(%37, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %35 = "riscv.remu"(%33, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%35) : (!riscv.reg) -> i32
        %28 = "builtin.unrealized_conversion_cast"(%32) : (i32) -> !riscv.reg
        %29 = "riscv.sext.w"(%28) : (!riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %26 = "riscv.sra"(%24, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%45) : (i1) -> !riscv.reg
        %20 = "riscv.czero.eqz"(%39, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.czero.nez"(%26, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.or"(%20, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i64
        "func.return"(%23) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
