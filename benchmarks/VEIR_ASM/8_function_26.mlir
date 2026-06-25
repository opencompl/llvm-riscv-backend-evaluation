"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i32, %arg6_2 : i64):
        %45 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %46 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %47 = "riscv.and"(%46, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %43 = "riscv.sext.w"(%42) : (!riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "riscv.divu"(%38, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %36 = "riscv.and"(%35, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.sra"(%36, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.divu"(%40, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.sra"(%47, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.div"(%24, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
