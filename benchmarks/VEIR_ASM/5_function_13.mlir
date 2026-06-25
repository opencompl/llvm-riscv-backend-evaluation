"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i32):
        %30 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %32 = "riscv.div"(%30, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %28 = "riscv.zext.w"(%27) : (!riscv.reg) -> !riscv.reg
        %25 = "riscv.srl"(%28, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.div"(%25, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "riscv.slt"(%32, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%17) : (!riscv.reg) -> i1
        "func.return"(%18) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
