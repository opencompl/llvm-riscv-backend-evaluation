"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %42 = "riscv.czero.eqz"(%39, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %43 = "riscv.czero.nez"(%40, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %44 = "riscv.or"(%42, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %37 = "riscv.xor"(%36, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.xor"(%37, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.and"(%33, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %25 = "riscv.xor"(%24, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.remu"(%29, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
