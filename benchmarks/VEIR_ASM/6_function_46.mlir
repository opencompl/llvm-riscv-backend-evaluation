"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %37 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %39 = "riscv.slt"(%38, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "riscv.xori"(%39) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%40) : (!riscv.reg) -> i1
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "riscv.xor"(%34, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "riscv.remu"(%35, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %27 = "riscv.and"(%26, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%41) : (i1) -> !riscv.reg
        %21 = "riscv.czero.eqz"(%31, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.czero.nez"(%27, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.or"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "builtin.unrealized_conversion_cast"(%23) : (!riscv.reg) -> i32
        "func.return"(%17) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
