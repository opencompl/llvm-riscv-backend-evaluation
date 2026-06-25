"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %28 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%28) : (!riscv.reg) -> i32
        %25 = "builtin.unrealized_conversion_cast"(%29) : (i32) -> !riscv.reg
        %26 = "riscv.zext.w"(%25) : (!riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %23 = "riscv.sra"(%26, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %17 = "riscv.czero.eqz"(%23, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.czero.nez"(%15, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.or"(%17, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
