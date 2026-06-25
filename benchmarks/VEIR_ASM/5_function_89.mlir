"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %37 = "riscv.sra"(%35, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %31 = "riscv.czero.eqz"(%37, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.czero.nez"(%29, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.or"(%31, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %24 = "riscv.czero.eqz"(%21, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.czero.nez"(%22, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.or"(%24, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.and"(%26, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i1
        "func.return"(%16) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
