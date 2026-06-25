builtin.module {
  func.func @func0(%arg6: i32, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i32 to !riscv.reg
    %1 = riscv.zext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %3 = riscv.xor %1, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = riscv.xor %3, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = riscv.or %1, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.xor %6, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.lui 0 : () -> !riscv.reg
    %9 = riscv.sltu %8, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %9 : !riscv.reg to i1
    func.return %10 : i1
  }
}

