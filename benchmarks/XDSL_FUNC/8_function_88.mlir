builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.rem %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = riscv.xor %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %7 = riscv.xor %6, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.xor %7, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.div %4, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %11 = riscv.rem %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %13 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %14 = riscv.xor %13, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.sltu %14, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = builtin.unrealized_conversion_cast %15 : !riscv.reg to i1
    func.return %16 : i1
  }
}

