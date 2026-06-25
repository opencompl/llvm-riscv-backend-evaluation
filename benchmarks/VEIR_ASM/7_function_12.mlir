"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %41 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%41) : (!riscv.reg) -> i32
        %38 = "builtin.unrealized_conversion_cast"(%42) : (i32) -> !riscv.reg
        %39 = "riscv.sext.w"(%38) : (!riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "riscv.sra"(%39, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "riscv.or"(%39, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.div"(%39, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %24 = "riscv.divu"(%22, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.slt"(%24, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.xori"(%19) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
