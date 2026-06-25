builtin.module {
  func.func @func0(%arg6: i32, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i32 to !riscv.reg
    %1 = riscv.sext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %3 = riscv.divu %1, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %3 : !riscv.reg to i32
    %5 = builtin.unrealized_conversion_cast %4 : i32 to !riscv.reg
    %6 = riscv.sext.w %5 : (!riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %9 = riscv.xor %8, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.divu %6, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i1
    func.return %11 : i1
  }
}

