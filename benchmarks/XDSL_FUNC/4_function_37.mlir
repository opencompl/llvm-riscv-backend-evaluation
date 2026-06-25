builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.rem %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = riscv.and %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %4 : !riscv.reg to i32
    %6 = builtin.unrealized_conversion_cast %5 : i32 to !riscv.reg
    %7 = riscv.zext.w %6 : (!riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %7 : !riscv.reg to i64
    func.return %8 : i64
  }
}

