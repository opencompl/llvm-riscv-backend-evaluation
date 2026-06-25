"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64):
        %46 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %47 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %48 = "riscv.and"(%47, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %44 = "riscv.divu"(%42, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "riscv.or"(%44, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %34 = "riscv.czero.eqz"(%31, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "riscv.czero.nez"(%40, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.or"(%34, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%36) : (!riscv.reg) -> i32
        %26 = "builtin.unrealized_conversion_cast"(%30) : (i32) -> !riscv.reg
        %27 = "riscv.sext.w"(%26) : (!riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %24 = "riscv.and"(%23, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.remu"(%27, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
