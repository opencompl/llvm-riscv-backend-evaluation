"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %40 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %42 = "riscv.div"(%40, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %38 = "riscv.and"(%42, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%38) : (!riscv.reg) -> i32
        %31 = "builtin.unrealized_conversion_cast"(%35) : (i32) -> !riscv.reg
        %32 = "riscv.sext.w"(%31) : (!riscv.reg) -> !riscv.reg
        %29 = "riscv.remu"(%42, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%29) : (!riscv.reg) -> i32
        %22 = "builtin.unrealized_conversion_cast"(%26) : (i32) -> !riscv.reg
        %23 = "riscv.zext.w"(%22) : (!riscv.reg) -> !riscv.reg
        %20 = "riscv.slt"(%32, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
