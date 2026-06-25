builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i1) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.or %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = riscv.or %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.and %4, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_2 : i1 to !riscv.reg
    %7 = riscv.czero.eqz %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.czero.nez %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.or %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %11 = riscv.xor %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.or %11, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %12 : !riscv.reg to i64
    func.return %13 : i64
  }
}

