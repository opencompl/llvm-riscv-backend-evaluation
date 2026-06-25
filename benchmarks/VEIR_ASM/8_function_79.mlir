"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i1):
        %43 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %45 = "riscv.divu"(%43, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%45) : (!riscv.reg) -> i32
        %38 = "builtin.unrealized_conversion_cast"(%42) : (i32) -> !riscv.reg
        %39 = "riscv.sext.w"(%38) : (!riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i1) -> !riscv.reg
        %34 = "riscv.czero.eqz"(%31, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "riscv.czero.nez"(%32, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.or"(%34, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%36) : (!riscv.reg) -> i32
        %26 = "builtin.unrealized_conversion_cast"(%30) : (i32) -> !riscv.reg
        %27 = "riscv.zext.w"(%26) : (!riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %24 = "riscv.div"(%22, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.sltu"(%39, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
