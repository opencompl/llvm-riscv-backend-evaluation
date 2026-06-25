"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i32):
        %28 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %29 = "riscv.sext.w"(%28) : (!riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %26 = "riscv.zext.w"(%25) : (!riscv.reg) -> !riscv.reg
        %23 = "riscv.div"(%26, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.srl"(%29, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i32
        "func.return"(%16) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
