builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i32) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.rem %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i32 to !riscv.reg
    %4 = riscv.zext.w %3 : (!riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %6 = riscv.div %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.srl %2, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %7 : !riscv.reg to i32
    %9 = builtin.unrealized_conversion_cast %8 : i32 to !riscv.reg
    %10 = riscv.zext.w %9 : (!riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i1
    func.return %11 : i1
  }
}

