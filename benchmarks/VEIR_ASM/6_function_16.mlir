"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i32):
        %36 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %39 = "riscv.czero.eqz"(%36, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "riscv.czero.nez"(%37, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "riscv.or"(%39, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i32) -> !riscv.reg
        %34 = "riscv.sext.w"(%33) : (!riscv.reg) -> !riscv.reg
        %31 = "riscv.srl"(%41, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.remu"(%41, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %23 = "riscv.div"(%27, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.xor"(%23, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.sltiu"(%18) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i1
        "func.return"(%20) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
