builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i1
    %2 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = riscv.or %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %1 : i1 to !riscv.reg
    %7 = riscv.czero.eqz %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.czero.nez %4, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.or %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %9 : !riscv.reg to i64
    func.return %10 : i64
  }
}

