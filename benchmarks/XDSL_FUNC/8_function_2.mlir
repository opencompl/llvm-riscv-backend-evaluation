builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i32, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i32 to !riscv.reg
    %1 = riscv.sext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = riscv.and %1, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i32 to !riscv.reg
    %4 = riscv.sext.w %3 : (!riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = riscv.remu %5, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.srl %2, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %9 = riscv.and %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %11 = riscv.remu %10, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.remu %9, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %12 : !riscv.reg to i64
    func.return %13 : i64
  }
}

