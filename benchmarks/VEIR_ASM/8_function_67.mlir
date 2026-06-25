"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %47 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %48 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %49 = "riscv.rem"(%47, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %45 = "riscv.and"(%44, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "riscv.or"(%45, %49) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %37 = "riscv.or"(%41, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.div"(%49, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.and"(%33, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.or"(%29, %49) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "riscv.sltu"(%25, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.xori"(%20) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i1
        "func.return"(%22) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
