builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i32, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.and %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i32 to !riscv.reg
    %4 = riscv.sext.w %3 : (!riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %6 = riscv.divu %5, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %8 = riscv.and %7, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.sra %8, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.divu %6, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.sra %2, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.div %11, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %12 : !riscv.reg to i64
    func.return %13 : i64
  }
}

