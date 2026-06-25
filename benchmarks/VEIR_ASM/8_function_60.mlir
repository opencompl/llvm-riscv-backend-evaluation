"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %44 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%44) : (!riscv.reg) -> i32
        %41 = "builtin.unrealized_conversion_cast"(%45) : (i32) -> !riscv.reg
        %42 = "riscv.sext.w"(%41) : (!riscv.reg) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%39) : (!riscv.reg) -> i1
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%40) : (i1) -> !riscv.reg
        %35 = "riscv.czero.eqz"(%32, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.czero.nez"(%33, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "riscv.or"(%35, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %30 = "riscv.rem"(%28, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %26 = "riscv.xor"(%30, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.div"(%42, %26) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
