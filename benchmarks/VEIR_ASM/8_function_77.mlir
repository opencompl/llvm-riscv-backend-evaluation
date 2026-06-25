"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i1):
        %48 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %49 = "builtin.unrealized_conversion_cast"(%48) : (!riscv.reg) -> i32
        %45 = "builtin.unrealized_conversion_cast"(%49) : (i32) -> !riscv.reg
        %46 = "riscv.sext.w"(%45) : (!riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %43 = "riscv.xor"(%42, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i1) -> !riscv.reg
        %37 = "riscv.czero.eqz"(%43, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "riscv.czero.nez"(%35, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.or"(%37, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %32 = "riscv.div"(%30, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.rem"(%39, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %24 = "riscv.or"(%28, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.xor"(%24, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
