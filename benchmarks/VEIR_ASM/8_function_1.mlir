"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i32, %arg6_2 : i1):
        %45 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %46 = "riscv.zext.w"(%45) : (!riscv.reg) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%46) : (!riscv.reg) -> i32
        %40 = "builtin.unrealized_conversion_cast"(%44) : (i32) -> !riscv.reg
        %41 = "riscv.zext.w"(%40) : (!riscv.reg) -> !riscv.reg
        %38 = "riscv.rem"(%46, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %34 = "riscv.sext.w"(%33) : (!riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i1) -> !riscv.reg
        %29 = "riscv.czero.eqz"(%46, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.czero.nez"(%34, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "riscv.or"(%29, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.rem"(%34, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.rem"(%38, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
