"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %50 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %51 = "builtin.unrealized_conversion_cast"(%50) : (!riscv.reg) -> i1
        %46 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %47 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %48 = "riscv.srl"(%46, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %44 = "riscv.sra"(%48, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %40 = "riscv.remu"(%38, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %36 = "riscv.srl"(%34, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%51) : (i1) -> !riscv.reg
        %30 = "riscv.czero.eqz"(%36, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "riscv.czero.nez"(%28, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.or"(%30, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%51) : (i1) -> !riscv.reg
        %23 = "riscv.czero.eqz"(%40, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.czero.nez"(%32, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.or"(%23, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%25) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
