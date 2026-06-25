builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i1, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %2 = riscv.divu %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %4 = riscv.and %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_1 : i1 to !riscv.reg
    %7 = riscv.czero.eqz %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.czero.nez %4, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.or %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %11 = riscv.and %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %11 : !riscv.reg to i1
    func.return %12 : i1
  }
}

