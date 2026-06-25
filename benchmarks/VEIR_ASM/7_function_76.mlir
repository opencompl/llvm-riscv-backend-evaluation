"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i1):
        %42 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %44 = "riscv.divu"(%42, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "riscv.divu"(%44, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %36 = "riscv.divu"(%40, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %32 = "riscv.or"(%31, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i1) -> !riscv.reg
        %26 = "riscv.czero.eqz"(%44, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.czero.nez"(%24, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.or"(%26, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.or"(%28, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
