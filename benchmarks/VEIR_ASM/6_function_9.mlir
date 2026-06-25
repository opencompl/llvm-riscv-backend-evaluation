"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i1, %arg6_3 : i32):
        %37 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i32) -> !riscv.reg
        %38 = "riscv.sext.w"(%37) : (!riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i1) -> !riscv.reg
        %33 = "riscv.czero.eqz"(%38, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.czero.nez"(%38, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "riscv.or"(%33, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %26 = "riscv.czero.eqz"(%23, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.czero.nez"(%35, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.or"(%26, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%28) : (!riscv.reg) -> i32
        %18 = "builtin.unrealized_conversion_cast"(%22) : (i32) -> !riscv.reg
        %19 = "riscv.zext.w"(%18) : (!riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i32
        "func.return"(%17) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
