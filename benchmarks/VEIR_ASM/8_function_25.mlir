"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i1, %arg6_2 : i64, %arg6_3 : i32):
        %40 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %43 = "riscv.czero.eqz"(%40, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %44 = "riscv.czero.nez"(%41, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %45 = "riscv.or"(%43, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %38 = "riscv.div"(%36, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i32) -> !riscv.reg
        %34 = "riscv.sext.w"(%33) : (!riscv.reg) -> !riscv.reg
        %31 = "riscv.srl"(%38, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.srl"(%31, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%27) : (!riscv.reg) -> i32
        %20 = "builtin.unrealized_conversion_cast"(%24) : (i32) -> !riscv.reg
        %21 = "riscv.sext.w"(%20) : (!riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i1
        "func.return"(%19) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
