"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i32, %arg6_2 : i64):
        %43 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %44 = "riscv.sext.w"(%43) : (!riscv.reg) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %41 = "riscv.or"(%44, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %37 = "riscv.rem"(%44, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%37) : (!riscv.reg) -> i32
        %30 = "builtin.unrealized_conversion_cast"(%34) : (i32) -> !riscv.reg
        %31 = "riscv.zext.w"(%30) : (!riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %28 = "riscv.remu"(%26, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %24 = "riscv.remu"(%28, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.div"(%41, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
