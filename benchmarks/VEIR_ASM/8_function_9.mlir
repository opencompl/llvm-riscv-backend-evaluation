"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %43 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %45 = "riscv.sra"(%43, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%41) : (!riscv.reg) -> i32
        %38 = "builtin.unrealized_conversion_cast"(%42) : (i32) -> !riscv.reg
        %39 = "riscv.sext.w"(%38) : (!riscv.reg) -> !riscv.reg
        %36 = "riscv.remu"(%39, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %32 = "riscv.and"(%31, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.divu"(%36, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.rem"(%28, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.div"(%45, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
