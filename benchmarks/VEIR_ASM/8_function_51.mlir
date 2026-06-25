"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i32):
        %43 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %45 = "riscv.sra"(%43, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "riscv.and"(%45, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "riscv.or"(%41, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %33 = "riscv.xor"(%32, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i32) -> !riscv.reg
        %29 = "riscv.zext.w"(%28) : (!riscv.reg) -> !riscv.reg
        %26 = "riscv.srl"(%33, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.div"(%37, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
