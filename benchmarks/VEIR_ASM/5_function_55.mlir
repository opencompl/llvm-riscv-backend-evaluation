"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %38 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %40 = "riscv.slt"(%38, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "riscv.xori"(%40) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%41) : (!riscv.reg) -> i1
        %31 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%42) : (i1) -> !riscv.reg
        %34 = "riscv.czero.eqz"(%31, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "riscv.czero.nez"(%32, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.or"(%34, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %29 = "riscv.remu"(%36, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%42) : (i1) -> !riscv.reg
        %23 = "riscv.czero.eqz"(%20, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.czero.nez"(%29, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.or"(%23, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %17 = "riscv.slt"(%25, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.xori"(%17) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i1
        "func.return"(%19) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
