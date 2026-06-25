builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.and %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = builtin.unrealized_conversion_cast %3 : !riscv.reg to i32
    %5 = builtin.unrealized_conversion_cast %4 : i32 to !riscv.reg
    %6 = riscv.zext.w %5 : (!riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %8 = builtin.unrealized_conversion_cast %7 : !riscv.reg to i32
    %9 = builtin.unrealized_conversion_cast %8 : i32 to !riscv.reg
    %10 = riscv.sext.w %9 : (!riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %12 = riscv.divu %11, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.srl %6, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.slt %13, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.xori %14, 1 : (!riscv.reg) -> !riscv.reg
    %16 = builtin.unrealized_conversion_cast %15 : !riscv.reg to i1
    func.return %16 : i1
  }
}

