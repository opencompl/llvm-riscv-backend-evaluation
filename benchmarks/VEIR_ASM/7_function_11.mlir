"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i64, %arg6_2 : i64):
        %38 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %39 = "riscv.zext.w"(%38) : (!riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %36 = "riscv.xor"(%35, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "riscv.srl"(%30, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%32) : (!riscv.reg) -> i32
        %25 = "builtin.unrealized_conversion_cast"(%29) : (i32) -> !riscv.reg
        %26 = "riscv.zext.w"(%25) : (!riscv.reg) -> !riscv.reg
        %23 = "riscv.div"(%36, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.rem"(%39, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
