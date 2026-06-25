"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %46 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %47 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %48 = "riscv.rem"(%46, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %44 = "riscv.xor"(%48, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %40 = "riscv.xor"(%39, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.xor"(%40, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.div"(%44, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %28 = "riscv.rem"(%32, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %24 = "riscv.xor"(%23, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.sltu"(%24, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
