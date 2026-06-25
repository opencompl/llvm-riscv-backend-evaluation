"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i32, %arg6_2 : i64):
        %43 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %44 = "riscv.sext.w"(%43) : (!riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "riscv.sltu"(%44, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "riscv.xori"(%40) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%41) : (!riscv.reg) -> i1
        %34 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %36 = "riscv.rem"(%34, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "riscv.div"(%30, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %28 = "riscv.srl"(%26, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%42) : (i1) -> !riscv.reg
        %22 = "riscv.czero.eqz"(%32, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.czero.nez"(%28, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.or"(%22, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%24) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
