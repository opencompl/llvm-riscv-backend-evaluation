"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i1):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %41 = "riscv.or"(%40, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %37 = "riscv.or"(%36, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.and"(%37, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i1) -> !riscv.reg
        %27 = "riscv.czero.eqz"(%33, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.czero.nez"(%33, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.or"(%27, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %22 = "riscv.xor"(%29, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.or"(%22, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i64
        "func.return"(%19) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
