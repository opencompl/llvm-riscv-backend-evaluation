builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.rem %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %5 = riscv.divu %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.div %2, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.rem %2, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.or %7, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.div %5, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %11 = riscv.div %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.rem %6, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %12 : !riscv.reg to i64
    func.return %13 : i64
  }
}

