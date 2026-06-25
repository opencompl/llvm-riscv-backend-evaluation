"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i32, %arg6_2 : i64):
        %36 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %37 = "riscv.zext.w"(%36) : (!riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %34 = "riscv.xor"(%33, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.div"(%37, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %26 = "riscv.remu"(%24, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.srl"(%34, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.divu"(%26, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i64
        "func.return"(%19) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
