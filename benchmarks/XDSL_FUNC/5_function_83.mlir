builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i32) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.or %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i32 to !riscv.reg
    %4 = riscv.sext.w %3 : (!riscv.reg) -> !riscv.reg
    %5 = riscv.sra %2, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %7 = riscv.div %6, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.slt %5, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.xori %8, 1 : (!riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %9 : !riscv.reg to i1
    func.return %10 : i1
  }
}

