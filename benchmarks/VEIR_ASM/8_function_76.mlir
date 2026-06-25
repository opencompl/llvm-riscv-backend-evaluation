"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %42 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %44 = "riscv.divu"(%42, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %40 = "riscv.div"(%44, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%36) : (!riscv.reg) -> i1
        %29 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%37) : (i1) -> !riscv.reg
        %32 = "riscv.czero.eqz"(%29, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.czero.nez"(%30, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.or"(%32, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.rem"(%40, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%27) : (!riscv.reg) -> i32
        %20 = "builtin.unrealized_conversion_cast"(%24) : (i32) -> !riscv.reg
        %21 = "riscv.zext.w"(%20) : (!riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i1
        "func.return"(%19) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
