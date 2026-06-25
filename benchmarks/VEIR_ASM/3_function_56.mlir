"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> i1, "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : i64):
        %18 = "builtin.unrealized_conversion_cast"(%arg6_0) : (i64) -> !riscv.reg
        %19 = "builtin.unrealized_conversion_cast"(%18) : (!riscv.reg) -> i32
        %15 = "builtin.unrealized_conversion_cast"(%19) : (i32) -> !riscv.reg
        %16 = "riscv.zext.w"(%15) : (!riscv.reg) -> !riscv.reg
        %14 = "builtin.unrealized_conversion_cast"(%16) : (!riscv.reg) -> i1
        "func.return"(%14) : (i1) -> ()
    }) : () -> ()
}) : () -> ()
