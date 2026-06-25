builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.xor %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = riscv.slt %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %4 : !riscv.reg to i1
    %6 = riscv.divu %2, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %8 = builtin.unrealized_conversion_cast %5 : i1 to !riscv.reg
    %9 = riscv.czero.eqz %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.czero.nez %6, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.or %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %11 : !riscv.reg to i64
    func.return %12 : i64
  }
}

