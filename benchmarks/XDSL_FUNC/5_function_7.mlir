builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %2 = riscv.sra %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = riscv.or %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.div %2, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %7 = riscv.remu %6, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %7 : !riscv.reg to i32
    func.return %8 : i32
  }
}

