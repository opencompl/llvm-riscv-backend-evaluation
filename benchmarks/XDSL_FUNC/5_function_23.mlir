builtin.module {
  func.func @func0(%arg6: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.zext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %3 : !riscv.reg to i32
    %5 = builtin.unrealized_conversion_cast %4 : i32 to !riscv.reg
    %6 = riscv.zext.w %5 : (!riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %6 : !riscv.reg to i32
    func.return %7 : i32
  }
}

