"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i1, %arg6_2 : i32):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %40 = "riscv.sext.w"(%39) : (!riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %35 = "riscv.czero.eqz"(%32, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.czero.nez"(%40, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "riscv.or"(%35, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %30 = "riscv.rem"(%28, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.or"(%30, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%26) : (!riscv.reg) -> i32
        %19 = "builtin.unrealized_conversion_cast"(%23) : (i32) -> !riscv.reg
        %20 = "riscv.zext.w"(%19) : (!riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
