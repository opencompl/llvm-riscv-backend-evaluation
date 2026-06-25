"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64, %arg6_1 : i64, %arg6_2 : i64):
        %43 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %44 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %45 = "riscv.divu"(%43, %44) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %40 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %41 = "riscv.or"(%40, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %35 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %37 = "riscv.divu"(%35, %45) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %33 = "riscv.div"(%41, %37) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %27 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %29 = "riscv.divu"(%27, %33) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %25 = "riscv.remu"(%45, %29) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %22 = "builtin.unrealized_conversion_cast"(%25) : (!riscv.reg) -> i32
        %18 = "builtin.unrealized_conversion_cast"(%22) : (i32) -> !riscv.reg
        %19 = "riscv.zext.w"(%18) : (!riscv.reg) -> !riscv.reg
        %20 = "builtin.unrealized_conversion_cast"(%19) : (!riscv.reg) -> i64
        "func.return"(%20) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
