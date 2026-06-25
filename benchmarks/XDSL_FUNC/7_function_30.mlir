builtin.module {
  func.func @func0(%arg6: i1, %arg6_1: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.sext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6 : i1 to !riscv.reg
    %5 = riscv.czero.eqz %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.czero.nez %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.or %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %9 = riscv.srl %3, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.and %9, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.remu %7, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %11 : !riscv.reg to i1
    func.return %12 : i1
  }
}

