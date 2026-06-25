builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.remu %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %2 : !riscv.reg to i32
    %4 = builtin.unrealized_conversion_cast %3 : i32 to !riscv.reg
    %5 = riscv.sext.w %4 : (!riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %8 = riscv.xor %7, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.and %8, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i32
    %12 = builtin.unrealized_conversion_cast %11 : i32 to !riscv.reg
    %13 = riscv.sext.w %12 : (!riscv.reg) -> !riscv.reg
    %14 = riscv.or %13, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = builtin.unrealized_conversion_cast %14 : !riscv.reg to i64
    func.return %15 : i64
  }
}

