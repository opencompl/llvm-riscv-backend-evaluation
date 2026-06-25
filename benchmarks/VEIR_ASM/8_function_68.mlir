"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %38 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "riscv.div"(%38, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "riscv.divu"(%34, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %32 = "riscv.rem"(%36, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%32) : (!riscv.reg) -> i32
        %25 = "builtin.unrealized_conversion_cast"(%29) : (i32) -> !riscv.reg
        %26 = "riscv.sext.w"(%25) : (!riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%26) : (!riscv.reg) -> i32
        %20 = "builtin.unrealized_conversion_cast"(%24) : (i32) -> !riscv.reg
        %21 = "riscv.zext.w"(%20) : (!riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
