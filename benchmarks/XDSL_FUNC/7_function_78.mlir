builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i32) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.rem %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i32 to !riscv.reg
    %4 = riscv.sext.w %3 : (!riscv.reg) -> !riscv.reg
    %5 = riscv.divu %4, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %4 : !riscv.reg to i32
    %7 = builtin.unrealized_conversion_cast %6 : i32 to !riscv.reg
    %8 = riscv.sext.w %7 : (!riscv.reg) -> !riscv.reg
    %9 = riscv.or %8, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.sltu %9, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.xori %10, 1 : (!riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %11 : !riscv.reg to i1
    func.return %12 : i1
  }
}

