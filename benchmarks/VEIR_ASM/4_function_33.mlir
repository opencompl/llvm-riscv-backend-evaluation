"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %27 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %29 = "riscv.xor"(%28, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.sltiu"(%29) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%30) : (!riscv.reg) -> i1
        %20 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%31) : (i1) -> !riscv.reg
        %23 = "riscv.czero.eqz"(%20, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.czero.nez"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.or"(%23, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %18 = "riscv.xor"(%25, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i32
        "func.return"(%15) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
