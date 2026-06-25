"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i1, %arg6_2 : i64):
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "riscv.rem"(%32, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %30 = "riscv.and"(%29, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %24 = "riscv.czero.eqz"(%34, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.czero.nez"(%30, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.or"(%24, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.div"(%34, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i32
        "func.return"(%16) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
