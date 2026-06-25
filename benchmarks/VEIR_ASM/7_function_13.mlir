"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %40 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %42 = "riscv.and"(%41, %40) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %38 = "riscv.divu"(%42, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %33 = "riscv.sltu"(%32, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.xori"(%33) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%34) : (!riscv.reg) -> i1
        %25 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %26 = "builtin.unrealized_conversion_cast"(%35) : (i1) -> !riscv.reg
        %27 = "riscv.czero.eqz"(%38, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.czero.nez"(%25, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %29 = "riscv.or"(%27, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%29) : (!riscv.reg) -> i32
        %19 = "builtin.unrealized_conversion_cast"(%23) : (i32) -> !riscv.reg
        %20 = "riscv.sext.w"(%19) : (!riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
