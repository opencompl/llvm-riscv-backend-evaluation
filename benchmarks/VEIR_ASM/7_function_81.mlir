"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i64, %arg6_2 : i64):
        %40 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %41 = "riscv.zext.w"(%40) : (!riscv.reg) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %38 = "riscv.srl"(%41, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.srl"(%41, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %30 = "riscv.zext.w"(%29) : (!riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %27 = "riscv.xor"(%30, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.rem"(%38, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.or"(%23, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
