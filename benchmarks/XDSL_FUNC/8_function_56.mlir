builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.div %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = builtin.unrealized_conversion_cast %3 : !riscv.reg to i32
    %5 = builtin.unrealized_conversion_cast %4 : i32 to !riscv.reg
    %6 = riscv.zext.w %5 : (!riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %9 = riscv.or %8, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %11 = riscv.remu %10, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.div %6, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.rem %2, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %13 : !riscv.reg to i32
    func.return %14 : i32
  }
}

