"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64):
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %37 = "riscv.divu"(%35, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %33 = "riscv.and"(%32, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %29 = "riscv.or"(%33, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%25) : (!riscv.reg) -> i32
        %22 = "builtin.unrealized_conversion_cast"(%26) : (i32) -> !riscv.reg
        %23 = "riscv.sext.w"(%22) : (!riscv.reg) -> !riscv.reg
        %18 = "riscv.xor"(%23, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.lui"() {immediate = 0 : i20} : () -> !riscv.reg
        %20 = "riscv.sltu"(%19, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
