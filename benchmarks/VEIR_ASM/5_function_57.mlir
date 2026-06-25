"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %32 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "riscv.srl"(%32, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %30 = "riscv.and"(%34, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %26 = "riscv.sra"(%24, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%26) : (!riscv.reg) -> i1
        %15 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%23) : (i1) -> !riscv.reg
        %18 = "riscv.czero.eqz"(%15, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.czero.nez"(%16, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.or"(%18, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
