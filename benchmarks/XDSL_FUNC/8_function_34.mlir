builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.sra %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = riscv.rem %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = riscv.div %5, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.or %6, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.or %2, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.div %8, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.rem %7, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i1
    func.return %11 : i1
  }
}

