builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i32) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.or %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i32 to !riscv.reg
    %4 = riscv.zext.w %3 : (!riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %6 = riscv.srl %5, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_2 : i32 to !riscv.reg
    %8 = riscv.sext.w %7 : (!riscv.reg) -> !riscv.reg
    %9 = riscv.remu %6, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.and %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.rem %2, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %11 : !riscv.reg to i32
    func.return %12 : i32
  }
}

