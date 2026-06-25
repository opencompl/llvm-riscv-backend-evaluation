"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i1):
        %36 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %38 = "riscv.remu"(%36, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %34 = "riscv.sra"(%38, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%34) : (!riscv.reg) -> i32
        %27 = "builtin.unrealized_conversion_cast"(%31) : (i32) -> !riscv.reg
        %28 = "riscv.zext.w"(%27) : (!riscv.reg) -> !riscv.reg
        %21 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i1) -> !riscv.reg
        %23 = "riscv.czero.eqz"(%34, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.czero.nez"(%21, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.or"(%23, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.remu"(%28, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i64
        "func.return"(%19) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
