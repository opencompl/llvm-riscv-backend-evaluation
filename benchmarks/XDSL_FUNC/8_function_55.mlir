builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.divu %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %4 = riscv.or %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = riscv.divu %5, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.div %4, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %9 = riscv.divu %8, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.remu %2, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i32
    %12 = builtin.unrealized_conversion_cast %11 : i32 to !riscv.reg
    %13 = riscv.zext.w %12 : (!riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %13 : !riscv.reg to i64
    func.return %14 : i64
  }
}

