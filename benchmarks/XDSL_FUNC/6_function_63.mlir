builtin.module {
  func.func @func0(%arg6: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.xor %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %2 : !riscv.reg to i32
    %4 = builtin.unrealized_conversion_cast %3 : i32 to !riscv.reg
    %5 = riscv.sext.w %4 : (!riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %5 : !riscv.reg to i32
    %7 = builtin.unrealized_conversion_cast %6 : i32 to !riscv.reg
    %8 = riscv.sext.w %7 : (!riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %8 : !riscv.reg to i32
    func.return %9 : i32
  }
}

