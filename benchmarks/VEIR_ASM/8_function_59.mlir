"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %41 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %43 = "riscv.and"(%42, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%43) : (!riscv.reg) -> i32
        %36 = "builtin.unrealized_conversion_cast"(%40) : (i32) -> !riscv.reg
        %37 = "riscv.sext.w"(%36) : (!riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "riscv.divu"(%32, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.divu"(%37, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %26 = "riscv.rem"(%34, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.rem"(%30, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
