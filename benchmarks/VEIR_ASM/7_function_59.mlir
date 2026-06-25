"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %36 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %39 = "riscv.czero.eqz"(%36, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "riscv.czero.nez"(%37, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "riscv.or"(%39, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %34 = "riscv.srl"(%32, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.sra"(%41, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.and"(%30, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%26) : (!riscv.reg) -> i32
        %19 = "builtin.unrealized_conversion_cast"(%23) : (i32) -> !riscv.reg
        %20 = "riscv.zext.w"(%19) : (!riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
