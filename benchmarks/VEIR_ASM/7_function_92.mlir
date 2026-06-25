"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%39) : (!riscv.reg) -> i32
        %36 = "builtin.unrealized_conversion_cast"(%40) : (i32) -> !riscv.reg
        %37 = "riscv.sext.w"(%36) : (!riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "riscv.and"(%33, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.xor"(%34, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%30) : (!riscv.reg) -> i1
        %19 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%27) : (i1) -> !riscv.reg
        %22 = "riscv.czero.eqz"(%19, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.czero.nez"(%37, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.or"(%22, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%24) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
