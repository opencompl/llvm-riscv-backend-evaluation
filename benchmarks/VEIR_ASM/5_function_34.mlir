"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i64, %arg6_2 : i64):
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %34 = "riscv.zext.w"(%33) : (!riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %31 = "riscv.xor"(%34, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.xor"(%31, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %23 = "riscv.or"(%34, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %17 = "riscv.xor"(%23, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.lui"() {immediate = 0 : i20} : () -> !riscv.reg
        %19 = "riscv.sltu"(%18, %17) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i1
        "func.return"(%20) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
