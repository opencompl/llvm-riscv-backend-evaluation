"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i32, %arg6_2 : i64):
        %45 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %46 = "riscv.sext.w"(%45) : (!riscv.reg) -> !riscv.reg
        %43 = "riscv.and"(%46, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %39 = "riscv.sext.w"(%38) : (!riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %36 = "riscv.remu"(%34, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.srl"(%43, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %28 = "riscv.and"(%32, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %24 = "riscv.remu"(%22, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.remu"(%28, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i64
        "func.return"(%21) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
