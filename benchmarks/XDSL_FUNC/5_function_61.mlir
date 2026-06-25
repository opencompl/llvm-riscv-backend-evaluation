builtin.module {
  func.func @func0(%arg6: i32, %arg6_1: i32) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i32 to !riscv.reg
    %1 = riscv.sext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_1 : i32 to !riscv.reg
    %3 = riscv.zext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = riscv.div %3, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.srl %1, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %5 : !riscv.reg to i32
    func.return %6 : i32
  }
}

