"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %37 = "riscv.or"(%36, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %33 = "riscv.and"(%32, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%29) : (!riscv.reg) -> i32
        %26 = "builtin.unrealized_conversion_cast"(%30) : (i32) -> !riscv.reg
        %27 = "riscv.zext.w"(%26) : (!riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %24 = "riscv.divu"(%27, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.xor"(%24, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.lui"() {immediate = 0 : i20} : () -> !riscv.reg
        %20 = "riscv.sltu"(%19, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i1
        "func.return"(%21) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
