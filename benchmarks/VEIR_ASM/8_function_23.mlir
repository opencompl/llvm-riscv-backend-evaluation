"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %40 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%40) : (!riscv.reg) -> i32
        %37 = "builtin.unrealized_conversion_cast"(%41) : (i32) -> !riscv.reg
        %38 = "riscv.zext.w"(%37) : (!riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "riscv.divu"(%38, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %31 = "riscv.div"(%29, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%31) : (!riscv.reg) -> i32
        %24 = "builtin.unrealized_conversion_cast"(%28) : (i32) -> !riscv.reg
        %25 = "riscv.zext.w"(%24) : (!riscv.reg) -> !riscv.reg
        %22 = "riscv.rem"(%35, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
