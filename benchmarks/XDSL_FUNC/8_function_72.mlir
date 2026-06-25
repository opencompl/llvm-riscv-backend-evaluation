builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.sext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %6 = riscv.xor %5, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %6 : !riscv.reg to i32
    %8 = builtin.unrealized_conversion_cast %7 : i32 to !riscv.reg
    %9 = riscv.zext.w %8 : (!riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %11 = riscv.divu %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.sra %3, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %12 : !riscv.reg to i1
    func.return %13 : i1
  }
}

