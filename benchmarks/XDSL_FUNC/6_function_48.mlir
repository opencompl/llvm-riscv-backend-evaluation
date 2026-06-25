builtin.module {
  func.func @func0(%arg6: i1, %arg6_1: i1, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %2 = riscv.rem %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i1 to !riscv.reg
    %4 = riscv.czero.eqz %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.czero.nez %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.or %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %8 = riscv.rem %7, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6 : i1 to !riscv.reg
    %10 = riscv.czero.eqz %6, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.czero.nez %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.or %10, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %12 : !riscv.reg to i1
    %14 = builtin.unrealized_conversion_cast %13 : i1 to !riscv.reg
    %15 = riscv.czero.eqz %6, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = riscv.czero.nez %12, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = riscv.or %15, %16 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = builtin.unrealized_conversion_cast %17 : !riscv.reg to i64
    func.return %18 : i64
  }
}

