"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i1, %arg6_2 : i64):
        %30 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %33 = "riscv.czero.eqz"(%30, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.czero.nez"(%31, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "riscv.or"(%33, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%35) : (!riscv.reg) -> i32
        %25 = "builtin.unrealized_conversion_cast"(%29) : (i32) -> !riscv.reg
        %26 = "riscv.zext.w"(%25) : (!riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%26) : (!riscv.reg) -> i32
        %20 = "builtin.unrealized_conversion_cast"(%24) : (i32) -> !riscv.reg
        %21 = "riscv.zext.w"(%20) : (!riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %18 = "riscv.rem"(%16, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i64
        "func.return"(%19) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
