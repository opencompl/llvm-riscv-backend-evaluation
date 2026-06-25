"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i32, %arg6_2 : i64):
        %45 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %46 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %47 = "riscv.xor"(%46, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i32) -> !riscv.reg
        %43 = "riscv.zext.w"(%42) : (!riscv.reg) -> !riscv.reg
        %40 = "riscv.and"(%43, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "riscv.sra"(%34, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "riscv.and"(%31, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.srl"(%40, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.sra"(%36, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.slt"(%40, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
