"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %35 = "riscv.remu"(%33, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %31 = "riscv.div"(%35, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %27 = "riscv.remu"(%25, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.div"(%31, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%23) : (!riscv.reg) -> i32
        %16 = "builtin.unrealized_conversion_cast"(%20) : (i32) -> !riscv.reg
        %17 = "riscv.zext.w"(%16) : (!riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%17) : (!riscv.reg) -> i64
        "func.return"(%18) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
