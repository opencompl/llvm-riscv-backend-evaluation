"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "riscv.sltu"(%34, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "riscv.xori"(%36) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%37) : (!riscv.reg) -> i1
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %32 = "riscv.remu"(%30, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.or"(%32, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %24 = "riscv.remu"(%22, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%38) : (i1) -> !riscv.reg
        %18 = "riscv.czero.eqz"(%32, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.czero.nez"(%24, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.or"(%18, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
