"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i1, %arg6_2 : i64):
        %44 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%44) : (!riscv.reg) -> i32
        %41 = "builtin.unrealized_conversion_cast"(%45) : (i32) -> !riscv.reg
        %42 = "riscv.zext.w"(%41) : (!riscv.reg) -> !riscv.reg
        %39 = "riscv.xor"(%42, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %33 = "riscv.czero.eqz"(%39, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.czero.nez"(%31, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "riscv.or"(%33, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.slt"(%39, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%28) : (!riscv.reg) -> i1
        %19 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%29) : (i1) -> !riscv.reg
        %22 = "riscv.czero.eqz"(%19, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.czero.nez"(%42, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.or"(%22, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%24) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
