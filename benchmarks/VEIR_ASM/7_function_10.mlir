"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i64, %arg6_2 : i64):
        %42 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %43 = "riscv.zext.w"(%42) : (!riscv.reg) -> !riscv.reg
        %40 = "riscv.srl"(%43, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.divu"(%40, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "riscv.rem"(%30, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %28 = "riscv.remu"(%26, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.remu"(%40, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.slt"(%24, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.xori"(%19) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
