"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64):
        %22 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %24 = "riscv.slt"(%22, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.xori"(%24) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%25) : (!riscv.reg) -> i1
        %15 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%26) : (i1) -> !riscv.reg
        %18 = "riscv.czero.eqz"(%15, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.czero.nez"(%16, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.or"(%18, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %14 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i32
        "func.return"(%14) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
