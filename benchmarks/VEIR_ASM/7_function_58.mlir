"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %42 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %44 = "riscv.xor"(%43, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %40 = "riscv.and"(%39, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %36 = "riscv.remu"(%40, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.rem"(%44, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.rem"(%32, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.and"(%28, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.slt"(%32, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.xori"(%19) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
