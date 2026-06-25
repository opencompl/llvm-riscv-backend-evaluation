"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i32):
        %29 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %32 = "riscv.czero.eqz"(%29, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.czero.nez"(%30, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.or"(%32, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %27 = "riscv.zext.w"(%26) : (!riscv.reg) -> !riscv.reg
        %23 = "riscv.xor"(%27, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.sltiu"(%23) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%24) : (!riscv.reg) -> i1
        %14 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%25) : (i1) -> !riscv.reg
        %17 = "riscv.czero.eqz"(%14, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.czero.nez"(%34, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.or"(%17, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
