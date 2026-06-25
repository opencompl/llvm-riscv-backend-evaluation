"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i32, %arg6_2 : i64):
        %45 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %46 = "builtin.unrealized_conversion_cast"(%45) : (!riscv.reg) -> i1
        %42 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %43 = "riscv.zext.w"(%42) : (!riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%46) : (i1) -> !riscv.reg
        %38 = "riscv.czero.eqz"(%43, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.czero.nez"(%36, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "riscv.or"(%38, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %33 = "riscv.zext.w"(%32) : (!riscv.reg) -> !riscv.reg
        %30 = "riscv.sra"(%40, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%26) : (!riscv.reg) -> i32
        %23 = "builtin.unrealized_conversion_cast"(%27) : (i32) -> !riscv.reg
        %24 = "riscv.zext.w"(%23) : (!riscv.reg) -> !riscv.reg
        %20 = "riscv.sltu"(%30, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.xori"(%20) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i1
        "func.return"(%22) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
