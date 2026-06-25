builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.zext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = riscv.srl %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.remu %3, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.srl %3, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %10 = builtin.unrealized_conversion_cast %9 : !riscv.reg to i32
    %11 = builtin.unrealized_conversion_cast %10 : i32 to !riscv.reg
    %12 = riscv.zext.w %11 : (!riscv.reg) -> !riscv.reg
    %13 = riscv.sltu %8, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %13 : !riscv.reg to i1
    func.return %14 : i1
  }
}

