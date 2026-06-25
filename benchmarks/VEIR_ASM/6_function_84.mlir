"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i32):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %41 = "riscv.srl"(%39, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %37 = "riscv.div"(%35, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %33 = "riscv.srl"(%37, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i32) -> !riscv.reg
        %29 = "riscv.sext.w"(%28) : (!riscv.reg) -> !riscv.reg
        %25 = "riscv.sltu"(%29, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.xori"(%25) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%26) : (!riscv.reg) -> i1
        %17 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%27) : (i1) -> !riscv.reg
        %19 = "riscv.czero.eqz"(%33, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.czero.nez"(%17, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.or"(%19, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i64
        "func.return"(%22) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
