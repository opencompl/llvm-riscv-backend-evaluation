builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.xor %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %4 = riscv.xor %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.slt %4, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.xori %5, 1 : (!riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %6 : !riscv.reg to i1
    func.return %7 : i1
  }
}

