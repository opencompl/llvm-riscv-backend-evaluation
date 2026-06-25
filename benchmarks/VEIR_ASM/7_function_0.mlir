"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %43 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %45 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %46 = "riscv.czero.eqz"(%43, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %47 = "riscv.czero.nez"(%44, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %48 = "riscv.or"(%46, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %42 = "builtin.unrealized_conversion_cast"(%41) : (!riscv.reg) -> i1
        %34 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%42) : (i1) -> !riscv.reg
        %37 = "riscv.czero.eqz"(%34, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %38 = "riscv.czero.nez"(%48, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "riscv.or"(%37, %38) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "riscv.or"(%39, %48) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %25 = "builtin.unrealized_conversion_cast"(%42) : (i1) -> !riscv.reg
        %26 = "riscv.czero.eqz"(%23, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.czero.nez"(%48, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.or"(%26, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %21 = "riscv.div"(%32, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
