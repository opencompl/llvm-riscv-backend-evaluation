builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.sext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %5 = riscv.sra %4, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %5 : !riscv.reg to i32
    %7 = builtin.unrealized_conversion_cast %6 : i32 to !riscv.reg
    %8 = riscv.zext.w %7 : (!riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %11 = riscv.xor %10, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.xor %11, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %12 : !riscv.reg to i64
    func.return %13 : i64
  }
}

