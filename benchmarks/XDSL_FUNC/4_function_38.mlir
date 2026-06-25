builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i32) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i32 to !riscv.reg
    %1 = riscv.sext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %3 = riscv.or %1, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %5 = riscv.remu %4, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.sltu %5, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.xori %6, 1 : (!riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %7 : !riscv.reg to i1
    func.return %8 : i1
  }
}

