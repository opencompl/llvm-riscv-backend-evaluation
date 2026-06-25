"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i1):
        %52 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %53 = "riscv.zext.w"(%52) : (!riscv.reg) -> !riscv.reg
        %48 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %49 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %50 = "riscv.or"(%49, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i1) -> !riscv.reg
        %44 = "riscv.czero.eqz"(%41, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %45 = "riscv.czero.nez"(%42, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %46 = "riscv.or"(%44, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i1) -> !riscv.reg
        %37 = "riscv.czero.eqz"(%34, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "riscv.czero.nez"(%46, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.or"(%37, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.div"(%46, %53) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.srl"(%39, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.remu"(%50, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.divu"(%53, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
