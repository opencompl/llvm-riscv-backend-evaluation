builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i32) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.divu %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = riscv.sra %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_1 : i32 to !riscv.reg
    %6 = riscv.zext.w %5 : (!riscv.reg) -> !riscv.reg
    %7 = riscv.xor %6, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %7 : !riscv.reg to i64
    func.return %8 : i64
  }
}

