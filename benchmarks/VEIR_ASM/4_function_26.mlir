"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %33 = "riscv.czero.eqz"(%30, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.czero.nez"(%31, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "riscv.or"(%33, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %27 = "riscv.xor"(%26, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.sltiu"(%27) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%28) : (!riscv.reg) -> i1
        %18 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%29) : (i1) -> !riscv.reg
        %21 = "riscv.czero.eqz"(%18, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.czero.nez"(%19, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.or"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "riscv.xor"(%23, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%16) : (!riscv.reg) -> i64
        "func.return"(%17) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
