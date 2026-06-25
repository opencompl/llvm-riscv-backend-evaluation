builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i32) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i32 to !riscv.reg
    %1 = riscv.zext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %3 = riscv.xor %1, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %3 : !riscv.reg to i32
    func.return %4 : i32
  }
}

