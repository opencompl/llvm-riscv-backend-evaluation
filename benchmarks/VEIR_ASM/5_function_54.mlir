"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %29 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %31 = "riscv.xor"(%30, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %27 = "riscv.div"(%25, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.divu"(%31, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.and"(%31, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i32
        "func.return"(%16) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
