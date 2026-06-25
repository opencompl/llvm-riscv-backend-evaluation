"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %50 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %51 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %52 = "riscv.slt"(%50, %51) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %53 = "riscv.xori"(%52) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %54 = "builtin.unrealized_conversion_cast"(%53) : (!riscv.reg) -> i1
        %43 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%54) : (i1) -> !riscv.reg
        %46 = "riscv.czero.eqz"(%43, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %47 = "riscv.czero.nez"(%44, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %48 = "riscv.or"(%46, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %41 = "riscv.sra"(%39, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %37 = "riscv.and"(%41, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.xor"(%37, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.remu"(%48, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%54) : (i1) -> !riscv.reg
        %23 = "riscv.czero.eqz"(%37, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.czero.nez"(%29, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.or"(%23, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%25) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
