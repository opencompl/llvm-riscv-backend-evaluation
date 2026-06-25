"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %25 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %27 = "riscv.or"(%26, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %21 = "riscv.czero.eqz"(%18, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.czero.nez"(%27, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.or"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %14 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %15 = "riscv.xor"(%14, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "riscv.sltiu"(%15) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%16) : (!riscv.reg) -> i1
        "func.return"(%17) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
