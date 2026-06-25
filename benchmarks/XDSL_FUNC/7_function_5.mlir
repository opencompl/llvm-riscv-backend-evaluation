builtin.module {
  func.func @func0(%arg6: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.and %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %2 : !riscv.reg to i32
    %4 = builtin.unrealized_conversion_cast %3 : i32 to !riscv.reg
    %5 = riscv.sext.w %4 : (!riscv.reg) -> !riscv.reg
    %6 = riscv.and %5, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %6 : !riscv.reg to i32
    %8 = builtin.unrealized_conversion_cast %7 : i32 to !riscv.reg
    %9 = riscv.zext.w %8 : (!riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %9 : !riscv.reg to i32
    func.return %10 : i32
  }
}

