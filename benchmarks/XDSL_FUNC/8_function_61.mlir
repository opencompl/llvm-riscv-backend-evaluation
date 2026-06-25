builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.zext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %5 = riscv.xor %4, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %8 = riscv.or %7, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.rem %8, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.xor %9, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %12 = riscv.srl %11, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %12 : !riscv.reg to i32
    func.return %13 : i32
  }
}

