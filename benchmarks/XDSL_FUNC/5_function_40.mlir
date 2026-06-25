builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.xor %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %5 = riscv.and %4, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.remu %2, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %9 = riscv.sra %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.sra %6, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i64
    func.return %11 : i64
  }
}

