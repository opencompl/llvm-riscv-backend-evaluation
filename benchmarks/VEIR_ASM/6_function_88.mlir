"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i1, %arg6_2 : i64):
        %40 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %43 = "riscv.czero.eqz"(%40, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %44 = "riscv.czero.nez"(%41, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %45 = "riscv.or"(%43, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "riscv.or"(%45, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "riscv.slt"(%32, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%34) : (!riscv.reg) -> i1
        %27 = "builtin.unrealized_conversion_cast"(%35) : (i1) -> !riscv.reg
        %28 = "riscv.czero.eqz"(%38, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.czero.nez"(%45, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.or"(%28, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %23 = "riscv.rem"(%30, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.xor"(%23, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.sltiu"(%18) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i1
        "func.return"(%20) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
