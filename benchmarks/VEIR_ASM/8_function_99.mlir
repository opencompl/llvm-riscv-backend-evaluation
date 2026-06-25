"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %47 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %48 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %49 = "riscv.sltu"(%48, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %50 = "builtin.unrealized_conversion_cast"(%49) : (!riscv.reg) -> i1
        %43 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %45 = "riscv.or"(%44, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %41 = "riscv.srl"(%45, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "riscv.div"(%45, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%50) : (i1) -> !riscv.reg
        %31 = "riscv.czero.eqz"(%37, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.czero.nez"(%29, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.or"(%31, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %26 = "riscv.xor"(%25, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.remu"(%26, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i1
        "func.return"(%19) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
