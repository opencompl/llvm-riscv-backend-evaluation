"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i32):
        %36 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %38 = "riscv.xor"(%37, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.sltiu"(%38) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%39) : (!riscv.reg) -> i1
        %33 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i32) -> !riscv.reg
        %34 = "riscv.sext.w"(%33) : (!riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%40) : (i1) -> !riscv.reg
        %29 = "riscv.czero.eqz"(%34, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.czero.nez"(%27, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "riscv.or"(%29, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %24 = "riscv.remu"(%22, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %20 = "riscv.and"(%24, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%17) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
