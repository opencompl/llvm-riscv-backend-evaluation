"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i1):
        %36 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %38 = "riscv.rem"(%36, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%34) : (!riscv.reg) -> i32
        %31 = "builtin.unrealized_conversion_cast"(%35) : (i32) -> !riscv.reg
        %32 = "riscv.sext.w"(%31) : (!riscv.reg) -> !riscv.reg
        %29 = "riscv.and"(%32, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i1) -> !riscv.reg
        %23 = "riscv.czero.eqz"(%38, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.czero.nez"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.or"(%23, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.srl"(%29, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i64
        "func.return"(%19) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
