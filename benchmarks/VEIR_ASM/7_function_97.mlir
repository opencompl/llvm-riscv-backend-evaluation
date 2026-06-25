"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i32):
        %37 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %39 = "riscv.remu"(%37, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %35 = "riscv.zext.w"(%34) : (!riscv.reg) -> !riscv.reg
        %32 = "riscv.srl"(%39, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%32) : (!riscv.reg) -> i32
        %25 = "builtin.unrealized_conversion_cast"(%29) : (i32) -> !riscv.reg
        %26 = "riscv.sext.w"(%25) : (!riscv.reg) -> !riscv.reg
        %23 = "riscv.xor"(%26, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %19 = "riscv.sra"(%17, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
