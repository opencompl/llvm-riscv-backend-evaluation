"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %44 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %46 = "riscv.div"(%44, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%46) : (!riscv.reg) -> i1
        %39 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %40 = "riscv.srl"(%46, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%40) : (!riscv.reg) -> i32
        %33 = "builtin.unrealized_conversion_cast"(%37) : (i32) -> !riscv.reg
        %34 = "riscv.zext.w"(%33) : (!riscv.reg) -> !riscv.reg
        %31 = "riscv.rem"(%46, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.srl"(%31, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%43) : (i1) -> !riscv.reg
        %21 = "riscv.czero.eqz"(%18, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.czero.nez"(%27, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.or"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%23) : (!riscv.reg) -> i64
        "func.return"(%24) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
