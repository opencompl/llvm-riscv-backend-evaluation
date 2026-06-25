"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %46 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %47 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %48 = "riscv.rem"(%46, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %44 = "riscv.divu"(%42, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "riscv.div"(%48, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.rem"(%48, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.or"(%36, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.div"(%44, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %24 = "riscv.div"(%28, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.rem"(%40, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
