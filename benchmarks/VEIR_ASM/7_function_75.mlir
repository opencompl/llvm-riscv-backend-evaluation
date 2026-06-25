"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %40 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %42 = "riscv.remu"(%40, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%42) : (!riscv.reg) -> i1
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "riscv.divu"(%34, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %32 = "riscv.rem"(%42, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.xor"(%32, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%39) : (i1) -> !riscv.reg
        %22 = "riscv.czero.eqz"(%19, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.czero.nez"(%28, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.or"(%22, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%24) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
