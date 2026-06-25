"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i32):
        %42 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %44 = "riscv.divu"(%42, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%44) : (!riscv.reg) -> i1
        %33 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%41) : (i1) -> !riscv.reg
        %36 = "riscv.czero.eqz"(%33, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "riscv.czero.nez"(%44, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "riscv.or"(%36, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%38) : (!riscv.reg) -> i1
        %28 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i32) -> !riscv.reg
        %29 = "riscv.zext.w"(%28) : (!riscv.reg) -> !riscv.reg
        %26 = "riscv.remu"(%38, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%32) : (i1) -> !riscv.reg
        %20 = "riscv.czero.eqz"(%29, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.czero.nez"(%26, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.or"(%20, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i64
        "func.return"(%23) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
