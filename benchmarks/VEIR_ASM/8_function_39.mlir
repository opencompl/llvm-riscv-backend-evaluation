"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i1, %arg6_2 : i64):
        %47 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %48 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %49 = "riscv.or"(%48, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %45 = "riscv.sra"(%43, %49) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %39 = "riscv.czero.eqz"(%36, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "riscv.czero.nez"(%37, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "riscv.or"(%39, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "riscv.and"(%33, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.or"(%41, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.divu"(%30, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.or"(%26, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
