"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32):
        %30 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %31 = "riscv.zext.w"(%30) : (!riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%31) : (!riscv.reg) -> i1
        %26 = "riscv.xor"(%31, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%29) : (i1) -> !riscv.reg
        %20 = "riscv.czero.eqz"(%31, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.czero.nez"(%26, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.or"(%20, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i1
        "func.return"(%16) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
