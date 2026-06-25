"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i32):
        %34 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %36 = "riscv.srl"(%34, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %31 = "riscv.slt"(%29, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.xori"(%31) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%32) : (!riscv.reg) -> i1
        %26 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i32) -> !riscv.reg
        %27 = "riscv.zext.w"(%26) : (!riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%33) : (i1) -> !riscv.reg
        %22 = "riscv.czero.eqz"(%19, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.czero.nez"(%27, %21) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.or"(%22, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %17 = "riscv.xor"(%16, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%17) : (!riscv.reg) -> i64
        "func.return"(%18) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
