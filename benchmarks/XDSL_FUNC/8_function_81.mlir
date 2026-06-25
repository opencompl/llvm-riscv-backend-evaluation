builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i1
    %2 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = builtin.unrealized_conversion_cast %1 : i1 to !riscv.reg
    %5 = riscv.czero.eqz %2, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.czero.nez %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.or %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %10 = riscv.div %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.sra %7, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.and %7, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %14 = riscv.div %12, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.div %11, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = riscv.sra %12, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = builtin.unrealized_conversion_cast %16 : !riscv.reg to i64
    func.return %17 : i64
  }
}

