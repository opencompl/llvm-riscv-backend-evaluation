"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%39) : (!riscv.reg) -> i32
        %36 = "builtin.unrealized_conversion_cast"(%40) : (i32) -> !riscv.reg
        %37 = "riscv.zext.w"(%36) : (!riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %34 = "riscv.rem"(%37, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %30 = "riscv.or"(%34, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%40) : (i32) -> !riscv.reg
        %26 = "riscv.sext.w"(%25) : (!riscv.reg) -> !riscv.reg
        %23 = "riscv.and"(%26, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.divu"(%37, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
