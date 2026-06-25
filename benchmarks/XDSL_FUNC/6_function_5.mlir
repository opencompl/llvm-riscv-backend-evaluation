builtin.module {
  func.func @func0(%arg6: i32) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i32 to !riscv.reg
    %1 = riscv.sext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %1 : !riscv.reg to i1
    %3 = builtin.unrealized_conversion_cast %2 : i1 to !riscv.reg
    %4 = riscv.czero.eqz %1, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.czero.nez %1, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.or %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %6 : !riscv.reg to i32
    %8 = builtin.unrealized_conversion_cast %7 : i32 to !riscv.reg
    %9 = riscv.zext.w %8 : (!riscv.reg) -> !riscv.reg
    %10 = riscv.sltu %1, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.xori %10, 1 : (!riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %11 : !riscv.reg to i1
    func.return %12 : i1
  }
}

