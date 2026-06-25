builtin.module {
  func.func @func0(%arg6: i32, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i32 to !riscv.reg
    %1 = riscv.zext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %3 = riscv.xor %2, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %5 = riscv.srl %4, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %5 : !riscv.reg to i32
    %7 = builtin.unrealized_conversion_cast %6 : i32 to !riscv.reg
    %8 = riscv.zext.w %7 : (!riscv.reg) -> !riscv.reg
    %9 = riscv.div %3, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.rem %1, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i64
    func.return %11 : i64
  }
}

