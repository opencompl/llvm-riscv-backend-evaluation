builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.remu %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %4 = builtin.unrealized_conversion_cast %3 : !riscv.reg to i32
    %5 = builtin.unrealized_conversion_cast %4 : i32 to !riscv.reg
    %6 = riscv.sext.w %5 : (!riscv.reg) -> !riscv.reg
    %7 = riscv.and %6, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.sltu %2, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.xori %8, 1 : (!riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %9 : !riscv.reg to i1
    func.return %10 : i1
  }
}

