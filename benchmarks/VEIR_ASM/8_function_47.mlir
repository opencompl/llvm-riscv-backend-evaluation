"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i64, %arg6_2 : i64):
        %45 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %46 = "riscv.sext.w"(%45) : (!riscv.reg) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%46) : (!riscv.reg) -> i1
        %41 = "riscv.rem"(%46, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%44) : (i1) -> !riscv.reg
        %35 = "riscv.czero.eqz"(%41, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.czero.nez"(%33, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "riscv.or"(%35, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %30 = "riscv.xor"(%29, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %26 = "riscv.divu"(%30, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.rem"(%37, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i1
        "func.return"(%19) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
