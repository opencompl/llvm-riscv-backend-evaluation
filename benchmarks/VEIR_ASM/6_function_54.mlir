"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %36 = "riscv.srl"(%34, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%32) : (!riscv.reg) -> i32
        %29 = "builtin.unrealized_conversion_cast"(%33) : (i32) -> !riscv.reg
        %30 = "riscv.sext.w"(%29) : (!riscv.reg) -> !riscv.reg
        %27 = "riscv.srl"(%36, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.remu"(%27, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.sltu"(%23, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.xori"(%18) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i1
        "func.return"(%20) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
