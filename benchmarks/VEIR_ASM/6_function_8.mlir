"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %41 = "riscv.divu"(%39, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %35 = "riscv.czero.eqz"(%32, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.czero.nez"(%41, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "riscv.or"(%35, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %30 = "riscv.srl"(%37, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %26 = "riscv.div"(%24, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %22 = "riscv.rem"(%26, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.slt"(%30, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i1
        "func.return"(%19) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
