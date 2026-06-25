"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %45 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %46 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %47 = "riscv.divu"(%45, %46) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %43 = "riscv.and"(%47, %47) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%43) : (!riscv.reg) -> i1
        %35 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %36 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %37 = "riscv.divu"(%35, %36) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.or"(%43, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %28 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %29 = "riscv.and"(%28, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%40) : (i1) -> !riscv.reg
        %23 = "riscv.czero.eqz"(%33, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %24 = "riscv.czero.nez"(%29, %22) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.or"(%23, %24) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%25) : (!riscv.reg) -> i32
        "func.return"(%19) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
