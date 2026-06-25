"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i1):
        %49 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %50 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %51 = "riscv.divu"(%49, %50) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %46 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %47 = "riscv.srl"(%45, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %43 = "riscv.sra"(%51, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i1) -> !riscv.reg
        %37 = "riscv.czero.eqz"(%34, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "riscv.czero.nez"(%35, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.or"(%37, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.sra"(%39, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.or"(%32, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %24 = "riscv.remu"(%22, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.sltu"(%28, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
