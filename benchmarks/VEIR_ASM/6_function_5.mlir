"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32):
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %36 = "riscv.sext.w"(%35) : (!riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%36) : (!riscv.reg) -> i1
        %28 = "builtin.unrealized_conversion_cast"(%34) : (i1) -> !riscv.reg
        %29 = "riscv.czero.eqz"(%36, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.czero.nez"(%36, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "riscv.or"(%29, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%31) : (!riscv.reg) -> i32
        %21 = "builtin.unrealized_conversion_cast"(%25) : (i32) -> !riscv.reg
        %22 = "riscv.zext.w"(%21) : (!riscv.reg) -> !riscv.reg
        %18 = "riscv.sltu"(%36, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.xori"(%18) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i1
        "func.return"(%20) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
