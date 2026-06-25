builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.and %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %4 = riscv.xor %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %4 : !riscv.reg to i1
    func.return %5 : i1
  }
}

