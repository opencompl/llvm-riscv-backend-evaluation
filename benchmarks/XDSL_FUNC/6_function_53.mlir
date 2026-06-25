builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i32, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i32 to !riscv.reg
    %1 = riscv.zext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %4 = riscv.xor %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.div %1, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %7 = riscv.remu %6, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.srl %4, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.divu %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %9 : !riscv.reg to i64
    func.return %10 : i64
  }
}

