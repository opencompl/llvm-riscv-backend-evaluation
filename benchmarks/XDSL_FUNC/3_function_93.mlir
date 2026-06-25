builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.sltu %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = riscv.xori %2, 1 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %3 : !riscv.reg to i1
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %7 = builtin.unrealized_conversion_cast %4 : i1 to !riscv.reg
    %8 = riscv.czero.eqz %5, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.czero.nez %6, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.or %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %12 = riscv.slt %11, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.xori %12, 1 : (!riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %13 : !riscv.reg to i1
    func.return %14 : i1
  }
}

