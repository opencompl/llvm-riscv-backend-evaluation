"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i32):
        %41 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %43 = "riscv.divu"(%41, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %39 = "riscv.slt"(%38, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%39) : (!riscv.reg) -> i1
        %34 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %35 = "riscv.zext.w"(%34) : (!riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%35) : (!riscv.reg) -> i32
        %29 = "builtin.unrealized_conversion_cast"(%33) : (i32) -> !riscv.reg
        %30 = "riscv.zext.w"(%29) : (!riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%40) : (i1) -> !riscv.reg
        %25 = "riscv.czero.eqz"(%30, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.czero.nez"(%23, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.or"(%25, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.sltu"(%27, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.xori"(%19) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
