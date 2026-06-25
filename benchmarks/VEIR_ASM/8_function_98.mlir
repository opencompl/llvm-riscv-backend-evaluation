"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %44 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %46 = "riscv.divu"(%44, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %42 = "riscv.rem"(%46, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "riscv.or"(%46, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.xor"(%38, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %30 = "riscv.divu"(%28, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.sra"(%34, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.divu"(%46, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
