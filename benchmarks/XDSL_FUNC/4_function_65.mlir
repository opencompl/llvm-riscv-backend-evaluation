builtin.module {
  func.func @func0(%arg6: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.rem %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = riscv.remu %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.xor %4, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.sltu %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %6 : !riscv.reg to i1
    func.return %7 : i1
  }
}

