"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %37 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %40 = "riscv.czero.eqz"(%37, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "riscv.czero.nez"(%38, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "riscv.or"(%40, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %35 = "riscv.or"(%42, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %31 = "riscv.srl"(%35, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.remu"(%35, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.rem"(%27, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.slt"(%42, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.xori"(%18) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i1
        "func.return"(%20) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
