"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : i32):
        %46 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %47 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %48 = "riscv.sra"(%46, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %43 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %44 = "riscv.remu"(%48, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %40 = "riscv.sltu"(%38, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%40) : (!riscv.reg) -> i1
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "riscv.div"(%34, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %29 = "builtin.unrealized_conversion_cast"(%41) : (i1) -> !riscv.reg
        %30 = "riscv.czero.eqz"(%27, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "riscv.czero.nez"(%36, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.or"(%30, %31) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "builtin.unrealized_conversion_cast"(%arg6_3) : (i32) -> !riscv.reg
        %25 = "riscv.zext.w"(%24) : (!riscv.reg) -> !riscv.reg
        %22 = "riscv.and"(%25, %32) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
