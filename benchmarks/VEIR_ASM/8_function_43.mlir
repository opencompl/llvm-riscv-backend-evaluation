"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i32, %arg6_1 : i1, %arg6_2 : i64):
        %44 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i32) -> !riscv.reg
        %45 = "riscv.sext.w"(%44) : (!riscv.reg) -> !riscv.reg
        %37 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i1) -> !riscv.reg
        %40 = "riscv.czero.eqz"(%37, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "riscv.czero.nez"(%45, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %42 = "riscv.or"(%40, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "riscv.sra"(%45, %42) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%35) : (!riscv.reg) -> i32
        %28 = "builtin.unrealized_conversion_cast"(%32) : (i32) -> !riscv.reg
        %29 = "riscv.sext.w"(%28) : (!riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %26 = "riscv.remu"(%45, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.divu"(%29, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
