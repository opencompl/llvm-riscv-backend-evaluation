builtin.module {
  func.func @func0(%arg6: i32) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i32 to !riscv.reg
    %1 = riscv.zext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %1 : !riscv.reg to i32
    %3 = builtin.unrealized_conversion_cast %2 : i32 to !riscv.reg
    %4 = riscv.zext.w %3 : (!riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %4 : !riscv.reg to i32
    func.return %5 : i32
  }
}

