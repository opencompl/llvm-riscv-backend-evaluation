"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %40 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%40) : (!riscv.reg) -> i32
        %37 = "builtin.unrealized_conversion_cast"(%41) : (i32) -> !riscv.reg
        %38 = "riscv.sext.w"(%37) : (!riscv.reg) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %35 = "riscv.xor"(%34, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%35) : (!riscv.reg) -> i32
        %28 = "builtin.unrealized_conversion_cast"(%32) : (i32) -> !riscv.reg
        %29 = "riscv.zext.w"(%28) : (!riscv.reg) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %26 = "riscv.divu"(%29, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.sra"(%38, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i1
        "func.return"(%19) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
