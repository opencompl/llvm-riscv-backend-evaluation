builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i1, %arg6_2: i32) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6_2 : i32 to !riscv.reg
    %1 = riscv.sext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i1 to !riscv.reg
    %4 = riscv.czero.eqz %1, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.czero.nez %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.or %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %8 = riscv.remu %7, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %8 : !riscv.reg to i1
    func.return %9 : i1
  }
}

