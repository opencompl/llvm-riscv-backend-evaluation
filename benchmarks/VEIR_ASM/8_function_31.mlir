"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %46 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %47 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %48 = "riscv.rem"(%46, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %44 = "riscv.divu"(%42, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%44) : (!riscv.reg) -> i32
        %37 = "builtin.unrealized_conversion_cast"(%41) : (i32) -> !riscv.reg
        %38 = "riscv.sext.w"(%37) : (!riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %35 = "riscv.srl"(%44, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "riscv.sltu"(%38, %35) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%31) : (!riscv.reg) -> i1
        %27 = "riscv.rem"(%38, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%32) : (i1) -> !riscv.reg
        %21 = "riscv.czero.eqz"(%18, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.czero.nez"(%27, %20) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.or"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%23) : (!riscv.reg) -> i64
        "func.return"(%24) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
