"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i1, %arg6_1 : i64, %arg6_2 : i64):
        %39 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %41 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %42 = "riscv.czero.eqz"(%39, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %43 = "riscv.czero.nez"(%40, %41) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %44 = "riscv.or"(%42, %43) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %32 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %33 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i1) -> !riscv.reg
        %35 = "riscv.czero.eqz"(%32, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %36 = "riscv.czero.nez"(%33, %34) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "riscv.or"(%35, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %30 = "riscv.remu"(%37, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %26 = "riscv.or"(%37, %30) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "riscv.divu"(%26, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "riscv.div"(%44, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i64
        "func.return"(%19) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
