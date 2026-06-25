"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %42 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %44 = "riscv.sra"(%42, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %40 = "riscv.srl"(%38, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%40) : (!riscv.reg) -> i32
        %33 = "builtin.unrealized_conversion_cast"(%37) : (i32) -> !riscv.reg
        %34 = "riscv.sext.w"(%33) : (!riscv.reg) -> !riscv.reg
        %31 = "riscv.rem"(%44, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%31) : (!riscv.reg) -> i32
        %24 = "builtin.unrealized_conversion_cast"(%28) : (i32) -> !riscv.reg
        %25 = "riscv.sext.w"(%24) : (!riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %20 = "riscv.xor"(%25, %18) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.lui"() {immediate = 0 : i20} : () -> !riscv.reg
        %22 = "riscv.sltu"(%21, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i1
        "func.return"(%23) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
