"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %28 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %30 = "riscv.and"(%29, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %26 = "riscv.div"(%30, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i32
        %19 = "builtin.unrealized_conversion_cast"(%23) : (i32) -> !riscv.reg
        %20 = "riscv.sext.w"(%19) : (!riscv.reg) -> !riscv.reg
        %17 = "riscv.rem"(%26, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%17) : (!riscv.reg) -> i64
        "func.return"(%18) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
