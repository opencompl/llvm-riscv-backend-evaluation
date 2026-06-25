"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i64, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64):
        %22 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %23 = "builtin.unrealized_conversion_cast"(%22) : (!riscv.reg) -> i32
        %19 = "builtin.unrealized_conversion_cast"(%23) : (i32) -> !riscv.reg
        %20 = "riscv.sext.w"(%19) : (!riscv.reg) -> !riscv.reg
        %18 = "builtin.unrealized_conversion_cast"(%20) : (!riscv.reg) -> i32
        %14 = "builtin.unrealized_conversion_cast"(%18) : (i32) -> !riscv.reg
        %15 = "riscv.zext.w"(%14) : (!riscv.reg) -> !riscv.reg
        %16 = "builtin.unrealized_conversion_cast"(%15) : (!riscv.reg) -> i64
        "func.return"(%16) : (i64) -> ()
    }) : () -> ()
}) : () -> ()
