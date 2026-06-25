"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i32):
        %42 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %44 = "riscv.or"(%43, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %40 = "riscv.zext.w"(%39) : (!riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %37 = "riscv.srl"(%35, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %33 = "riscv.sext.w"(%32) : (!riscv.reg) -> !riscv.reg
        %30 = "riscv.remu"(%37, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.and"(%33, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.rem"(%44, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
