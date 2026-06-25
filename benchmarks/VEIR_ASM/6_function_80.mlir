"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i32):
        %37 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %38 = "riscv.zext.w"(%37) : (!riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %33 = "riscv.czero.eqz"(%30, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.czero.nez"(%38, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "riscv.or"(%33, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %28 = "riscv.and"(%27, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.xor"(%35, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.srl"(%35, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%17) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
