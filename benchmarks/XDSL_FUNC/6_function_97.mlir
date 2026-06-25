builtin.module {
  func.func @func0(%arg6: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.sext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %3 : !riscv.reg to i1
    %5 = builtin.unrealized_conversion_cast %4 : i1 to !riscv.reg
    %6 = riscv.czero.eqz %3, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.czero.nez %3, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.or %6, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.and %8, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %9 : !riscv.reg to i32
    func.return %10 : i32
  }
}

