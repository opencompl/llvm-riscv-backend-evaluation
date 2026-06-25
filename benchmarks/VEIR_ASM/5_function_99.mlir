"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %29 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %32 = "riscv.czero.eqz"(%29, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.czero.nez"(%30, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.or"(%32, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %27 = "riscv.xor"(%26, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %23 = "riscv.div"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.divu"(%27, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i1
        "func.return"(%16) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
