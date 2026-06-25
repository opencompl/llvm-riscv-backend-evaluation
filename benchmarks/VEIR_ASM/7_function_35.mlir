"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64):
        %37 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%37) : (!riscv.reg) -> i32
        %34 = "builtin.unrealized_conversion_cast"(%38) : (i32) -> !riscv.reg
        %35 = "riscv.zext.w"(%34) : (!riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%38) : (i32) -> !riscv.reg
        %32 = "riscv.zext.w"(%31) : (!riscv.reg) -> !riscv.reg
        %29 = "riscv.sra"(%35, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %25 = "riscv.srl"(%29, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %21 = "riscv.and"(%25, %19) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
