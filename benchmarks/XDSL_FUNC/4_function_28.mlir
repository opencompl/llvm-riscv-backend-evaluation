builtin.module {
  func.func @func0(%arg6: i32, %arg6_1: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i32 to !riscv.reg
    %1 = riscv.zext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = riscv.rem %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.or %4, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.div %1, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %6 : !riscv.reg to i64
    func.return %7 : i64
  }
}

