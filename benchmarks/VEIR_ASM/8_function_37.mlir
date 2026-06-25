"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %44 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %46 = "riscv.xor"(%45, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %42 = "riscv.rem"(%46, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %38 = "riscv.divu"(%36, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %34 = "riscv.or"(%38, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.xor"(%34, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.remu"(%46, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.remu"(%26, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
