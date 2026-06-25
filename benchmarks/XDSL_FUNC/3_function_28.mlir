builtin.module {
  func.func @func0(%arg6: i1, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.or %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6 : i1 to !riscv.reg
    %5 = riscv.czero.eqz %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.czero.nez %2, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.or %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %9 = riscv.xor %8, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.sltiu %9, 1 : (!riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i1
    func.return %11 : i1
  }
}

