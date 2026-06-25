"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i1, %arg6_2 : i64):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %41 = "riscv.rem"(%39, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %37 = "riscv.srl"(%41, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %31 = "riscv.czero.eqz"(%41, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.czero.nez"(%37, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.or"(%31, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %26 = "riscv.and"(%25, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.or"(%26, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %18 = "riscv.sltu"(%22, %16) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i1
        "func.return"(%19) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
