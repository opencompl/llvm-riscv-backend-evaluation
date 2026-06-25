builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.sltu %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = riscv.xori %2, 1 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %3 : !riscv.reg to i1
    %5 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %7 = riscv.remu %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.or %7, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %10 = riscv.remu %9, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %4 : i1 to !riscv.reg
    %12 = riscv.czero.eqz %7, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.czero.nez %10, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.or %12, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = builtin.unrealized_conversion_cast %14 : !riscv.reg to i64
    func.return %15 : i64
  }
}

