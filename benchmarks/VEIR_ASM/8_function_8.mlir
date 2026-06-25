"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i32):
        %46 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %47 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %48 = "riscv.or"(%47, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %44 = "riscv.and"(%48, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %40 = "riscv.xor"(%39, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %36 = "riscv.and"(%35, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i32) -> !riscv.reg
        %32 = "riscv.zext.w"(%31) : (!riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %29 = "riscv.and"(%28, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.or"(%29, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.xor"(%25, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.sltiu"(%20) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i1
        "func.return"(%22) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
