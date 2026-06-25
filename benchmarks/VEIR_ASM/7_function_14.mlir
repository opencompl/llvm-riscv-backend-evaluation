"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i32, %arg6_2 : i1):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %40 = "riscv.sext.w"(%39) : (!riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %37 = "riscv.and"(%40, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%37) : (!riscv.reg) -> i32
        %30 = "builtin.unrealized_conversion_cast"(%34) : (i32) -> !riscv.reg
        %31 = "riscv.zext.w"(%30) : (!riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i1) -> !riscv.reg
        %26 = "riscv.czero.eqz"(%40, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.czero.nez"(%40, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.or"(%26, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.or"(%28, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
