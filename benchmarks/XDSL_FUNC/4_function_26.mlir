builtin.module {
  func.func @func0(%arg6: i1, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6 : i1 to !riscv.reg
    %3 = riscv.czero.eqz %0, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = riscv.czero.nez %1, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.or %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %7 = riscv.xor %6, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.sltiu %7, 1 : (!riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %8 : !riscv.reg to i1
    %10 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %12 = builtin.unrealized_conversion_cast %9 : i1 to !riscv.reg
    %13 = riscv.czero.eqz %10, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.czero.nez %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.or %13, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = riscv.xor %15, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = builtin.unrealized_conversion_cast %16 : !riscv.reg to i64
    func.return %17 : i64
  }
}

