"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %36 = "riscv.sltu"(%35, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%36) : (!riscv.reg) -> i1
        %30 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "riscv.rem"(%30, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%37) : (i1) -> !riscv.reg
        %26 = "riscv.czero.eqz"(%23, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.czero.nez"(%32, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.or"(%26, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%28) : (!riscv.reg) -> i32
        %18 = "builtin.unrealized_conversion_cast"(%22) : (i32) -> !riscv.reg
        %19 = "riscv.zext.w"(%18) : (!riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i32
        "func.return"(%17) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
