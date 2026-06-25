"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %36 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %38 = "riscv.or"(%37, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "riscv.divu"(%32, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %30 = "riscv.rem"(%34, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %26 = "riscv.sra"(%24, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.rem"(%30, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.srl"(%38, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i64
        "func.return"(%19) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
