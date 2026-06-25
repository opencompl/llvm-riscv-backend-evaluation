"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i32):
        %48 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %49 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %50 = "riscv.sltu"(%49, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %51 = "riscv.xori"(%50) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %52 = "builtin.unrealized_conversion_cast"(%51) : (!riscv.reg) -> i1
        %44 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %46 = "riscv.or"(%45, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %42 = "riscv.divu"(%40, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "riscv.xor"(%42, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "riscv.xor"(%38, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.and"(%34, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i32) -> !riscv.reg
        %26 = "riscv.zext.w"(%25) : (!riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%52) : (i1) -> !riscv.reg
        %21 = "riscv.czero.eqz"(%30, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.czero.nez"(%26, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.or"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%23) : (!riscv.reg) -> i64
        "func.return"(%24) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
