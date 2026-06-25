builtin.module {
  func.func @func0(%arg6: i1, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.divu %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6 : i1 to !riscv.reg
    %5 = riscv.czero.eqz %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.czero.nez %2, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.or %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.remu %7, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.rem %2, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.xor %9, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.sltiu %10, 1 : (!riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %11 : !riscv.reg to i1
    func.return %12 : i1
  }
}

