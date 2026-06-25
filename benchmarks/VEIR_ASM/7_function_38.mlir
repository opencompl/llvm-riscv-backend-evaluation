"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i32, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %43 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %45 = "riscv.divu"(%43, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %39 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %41 = "riscv.and"(%45, %39) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %37 = "riscv.remu"(%41, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %31 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %32 = "riscv.xor"(%31, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.sltiu"(%32) {immediate = 1 : si12} : (!riscv.reg) -> !riscv.reg
        %34 = "builtin.unrealized_conversion_cast"(%33) : (!riscv.reg) -> i1
        %25 = "builtin.unrealized_conversion_cast"(%34) : (i1) -> !riscv.reg
        %26 = "riscv.czero.eqz"(%45, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "riscv.czero.nez"(%41, %25) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %28 = "riscv.or"(%26, %27) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %21 = "riscv.or"(%20, %28) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%21) : (!riscv.reg) -> i32
        "func.return"(%18) : (i32) -> ()
    }) : () -> ()
}) : () -> ()
