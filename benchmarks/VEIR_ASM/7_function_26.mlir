"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %41 = "riscv.srl"(%39, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %37 = "riscv.and"(%41, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.xor"(%37, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %29 = "riscv.remu"(%27, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.div"(%29, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.sra"(%33, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i1
        "func.return"(%18) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
