builtin.module {
  func.func @func0(%arg6: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.zext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %6 = riscv.rem %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.and %6, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.divu %7, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %8 : !riscv.reg to i32
    func.return %9 : i32
  }
}

