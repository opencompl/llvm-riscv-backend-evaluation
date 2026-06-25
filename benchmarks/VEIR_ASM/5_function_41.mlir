"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %26 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %29 = "riscv.czero.eqz"(%26, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.czero.nez"(%27, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "riscv.or"(%29, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%31) : (!riscv.reg) -> i32
        %21 = "builtin.unrealized_conversion_cast"(%25) : (i32) -> !riscv.reg
        %22 = "riscv.zext.w"(%21) : (!riscv.reg) -> !riscv.reg
        %19 = "riscv.or"(%22, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i32
        "func.return"(%16) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
