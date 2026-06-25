"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %35 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %37 = "riscv.divu"(%35, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %31 = "riscv.czero.eqz"(%28, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.czero.nez"(%37, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.or"(%31, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.remu"(%33, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.rem"(%37, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "riscv.xor"(%22, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.sltiu"(%17) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i1
        "func.return"(%19) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
