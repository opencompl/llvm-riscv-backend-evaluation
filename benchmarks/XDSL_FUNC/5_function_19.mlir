builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i32) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.or %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %5 = riscv.sra %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.remu %2, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_2 : i32 to !riscv.reg
    %8 = riscv.zext.w %7 : (!riscv.reg) -> !riscv.reg
    %9 = riscv.sltu %6, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %9 : !riscv.reg to i1
    func.return %10 : i1
  }
}

