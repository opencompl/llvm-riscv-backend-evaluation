builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.xor %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %5 = riscv.and %4, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %7 = riscv.remu %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.rem %2, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.rem %8, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.and %9, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.slt %8, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.xori %11, 1 : (!riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %12 : !riscv.reg to i1
    func.return %13 : i1
  }
}

