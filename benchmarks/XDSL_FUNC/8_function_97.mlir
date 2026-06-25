builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i32) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.sext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %5 = riscv.xor %4, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_2 : i32 to !riscv.reg
    %7 = riscv.zext.w %6 : (!riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %9 = riscv.remu %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.or %9, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6_2 : i32 to !riscv.reg
    %12 = riscv.sext.w %11 : (!riscv.reg) -> !riscv.reg
    %13 = riscv.divu %10, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %13 : !riscv.reg to i64
    func.return %14 : i64
  }
}

