builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.or %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = riscv.srl %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %5 : !riscv.reg to i32
    %7 = builtin.unrealized_conversion_cast %6 : i32 to !riscv.reg
    %8 = riscv.sext.w %7 : (!riscv.reg) -> !riscv.reg
    %9 = riscv.sltu %8, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.xori %9, 1 : (!riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i1
    func.return %11 : i1
  }
}

