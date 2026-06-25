"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%39) : (!riscv.reg) -> i32
        %36 = "builtin.unrealized_conversion_cast"(%40) : (i32) -> !riscv.reg
        %37 = "riscv.zext.w"(%36) : (!riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %34 = "riscv.sra"(%37, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%34) : (!riscv.reg) -> i32
        %27 = "builtin.unrealized_conversion_cast"(%31) : (i32) -> !riscv.reg
        %28 = "riscv.sext.w"(%27) : (!riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%28) : (!riscv.reg) -> i32
        %22 = "builtin.unrealized_conversion_cast"(%26) : (i32) -> !riscv.reg
        %23 = "riscv.zext.w"(%22) : (!riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %20 = "riscv.remu"(%18, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
