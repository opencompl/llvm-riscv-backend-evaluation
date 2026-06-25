"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i64, %arg6_2 : i64):
        %45 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %46 = "riscv.sext.w"(%45) : (!riscv.reg) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %43 = "riscv.divu"(%41, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %38 = "riscv.sltu"(%43, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.xori"(%38) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%39) : (!riscv.reg) -> i1
        %29 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%40) : (i1) -> !riscv.reg
        %32 = "riscv.czero.eqz"(%29, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.czero.nez"(%43, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %34 = "riscv.or"(%32, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.and"(%34, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "riscv.xor"(%27, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "riscv.divu"(%27, %23) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
