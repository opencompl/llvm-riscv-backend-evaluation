"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %24 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %27 = "riscv.czero.eqz"(%24, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.czero.nez"(%25, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.or"(%27, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %22 = "riscv.remu"(%29, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %18 = "riscv.srl"(%22, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %15 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i32
        "func.return"(%15) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
