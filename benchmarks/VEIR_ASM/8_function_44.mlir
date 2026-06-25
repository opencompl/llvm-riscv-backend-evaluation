"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %44 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %46 = "riscv.div"(%44, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%46) : (!riscv.reg) -> i32
        %39 = "builtin.unrealized_conversion_cast"(%43) : (i32) -> !riscv.reg
        %40 = "riscv.zext.w"(%39) : (!riscv.reg) -> !riscv.reg
        %37 = "riscv.remu"(%46, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %33 = "riscv.and"(%37, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %29 = "riscv.div"(%27, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.or"(%29, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.slt"(%40, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.xori"(%20) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i1
        "func.return"(%22) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
