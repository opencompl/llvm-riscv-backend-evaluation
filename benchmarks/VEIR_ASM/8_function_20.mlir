"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %41 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %43 = "riscv.sra"(%41, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %39 = "riscv.rem"(%43, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%39) : (!riscv.reg) -> i32
        %32 = "builtin.unrealized_conversion_cast"(%36) : (i32) -> !riscv.reg
        %33 = "riscv.zext.w"(%32) : (!riscv.reg) -> !riscv.reg
        %30 = "riscv.srl"(%33, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.divu"(%43, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %22 = "riscv.and"(%21, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
