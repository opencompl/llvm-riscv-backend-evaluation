"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i32):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %41 = "riscv.div"(%39, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %37 = "riscv.or"(%36, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %33 = "riscv.zext.w"(%32) : (!riscv.reg) -> !riscv.reg
        %30 = "riscv.rem"(%37, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %26 = "riscv.sext.w"(%25) : (!riscv.reg) -> !riscv.reg
        %23 = "riscv.sra"(%26, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.divu"(%30, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
