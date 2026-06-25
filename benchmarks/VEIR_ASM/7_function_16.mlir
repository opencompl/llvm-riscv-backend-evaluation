"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i32):
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %38 = "riscv.czero.eqz"(%35, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.czero.nez"(%36, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "riscv.or"(%38, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %33 = "riscv.div"(%40, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i32) -> !riscv.reg
        %29 = "riscv.zext.w"(%28) : (!riscv.reg) -> !riscv.reg
        %26 = "riscv.sra"(%33, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%26) : (!riscv.reg) -> i32
        %19 = "builtin.unrealized_conversion_cast"(%23) : (i32) -> !riscv.reg
        %20 = "riscv.sext.w"(%19) : (!riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
