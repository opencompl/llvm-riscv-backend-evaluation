"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i32):
        %28 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %30 = "riscv.div"(%28, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %26 = "riscv.srl"(%30, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %22 = "riscv.zext.w"(%21) : (!riscv.reg) -> !riscv.reg
        %19 = "riscv.rem"(%26, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i32
        "func.return"(%16) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
