builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i32, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i32 to !riscv.reg
    %1 = riscv.zext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %3 = riscv.rem %2, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = riscv.srl %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %8 = riscv.div %7, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.sra %3, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %9 : !riscv.reg to i1
    func.return %10 : i1
  }
}

