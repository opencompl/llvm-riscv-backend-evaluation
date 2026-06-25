builtin.module {
  func.func @func0(%arg6: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.zext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %5 = riscv.or %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %5 : !riscv.reg to i64
    func.return %6 : i64
  }
}

