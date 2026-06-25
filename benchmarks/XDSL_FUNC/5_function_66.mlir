builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.zext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %3 : !riscv.reg to i32
    %5 = builtin.unrealized_conversion_cast %4 : i32 to !riscv.reg
    %6 = riscv.zext.w %5 : (!riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %8 = riscv.remu %7, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %8 : !riscv.reg to i64
    func.return %9 : i64
  }
}

