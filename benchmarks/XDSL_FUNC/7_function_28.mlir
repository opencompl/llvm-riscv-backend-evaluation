builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i32) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6_2 : i32 to !riscv.reg
    %1 = riscv.zext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %1 : !riscv.reg to i32
    %3 = builtin.unrealized_conversion_cast %2 : i32 to !riscv.reg
    %4 = riscv.zext.w %3 : (!riscv.reg) -> !riscv.reg
    %5 = riscv.rem %4, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %7 = riscv.rem %6, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %9 = riscv.divu %8, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %9 : !riscv.reg to i32
    func.return %10 : i32
  }
}

