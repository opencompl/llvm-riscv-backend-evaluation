"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %37 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %39 = "riscv.remu"(%37, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %35 = "riscv.div"(%33, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%35) : (!riscv.reg) -> i1
        %24 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%32) : (i1) -> !riscv.reg
        %27 = "riscv.czero.eqz"(%24, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.czero.nez"(%35, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.or"(%27, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.div"(%39, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.srl"(%22, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i64
        "func.return"(%19) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
