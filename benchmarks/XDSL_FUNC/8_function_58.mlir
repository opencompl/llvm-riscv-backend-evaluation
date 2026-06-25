builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.div %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = riscv.and %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %4 : !riscv.reg to i32
    %6 = builtin.unrealized_conversion_cast %5 : i32 to !riscv.reg
    %7 = riscv.sext.w %6 : (!riscv.reg) -> !riscv.reg
    %8 = riscv.remu %2, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %8 : !riscv.reg to i32
    %10 = builtin.unrealized_conversion_cast %9 : i32 to !riscv.reg
    %11 = riscv.zext.w %10 : (!riscv.reg) -> !riscv.reg
    %12 = riscv.slt %7, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %12 : !riscv.reg to i1
    func.return %13 : i1
  }
}

