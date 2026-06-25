"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64):
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%34) : (!riscv.reg) -> i32
        %31 = "builtin.unrealized_conversion_cast"(%35) : (i32) -> !riscv.reg
        %32 = "riscv.sext.w"(%31) : (!riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%32) : (!riscv.reg) -> i1
        %24 = "builtin.unrealized_conversion_cast"(%30) : (i1) -> !riscv.reg
        %25 = "riscv.czero.eqz"(%32, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.czero.nez"(%32, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.or"(%25, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.and"(%27, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i32
        "func.return"(%17) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
