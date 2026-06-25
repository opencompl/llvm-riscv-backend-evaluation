"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i32):
        %43 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%43) : (!riscv.reg) -> i32
        %40 = "builtin.unrealized_conversion_cast"(%44) : (i32) -> !riscv.reg
        %41 = "riscv.sext.w"(%40) : (!riscv.reg) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %38 = "riscv.xor"(%37, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %34 = "riscv.zext.w"(%33) : (!riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %31 = "riscv.remu"(%34, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.or"(%31, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %23 = "riscv.sext.w"(%22) : (!riscv.reg) -> !riscv.reg
        %20 = "riscv.divu"(%27, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
