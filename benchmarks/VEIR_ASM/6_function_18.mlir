"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i1):
        %44 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %46 = "riscv.or"(%45, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i1) -> !riscv.reg
        %40 = "riscv.czero.eqz"(%37, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "riscv.czero.nez"(%38, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "riscv.or"(%40, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "riscv.sra"(%33, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i1) -> !riscv.reg
        %29 = "riscv.czero.eqz"(%35, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.czero.nez"(%35, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "riscv.or"(%29, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.srl"(%42, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.xor"(%24, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.lui"() {immediate = 0 : i20} : () -> !riscv.reg
        %20 = "riscv.sltu"(%19, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
