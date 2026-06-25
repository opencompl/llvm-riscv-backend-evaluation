builtin.module {
  func.func @func0(%arg6: i32, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i32 to !riscv.reg
    %1 = riscv.zext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = riscv.srl %1, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = riscv.divu %2, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %5 = riscv.rem %4, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %7 = riscv.remu %6, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.remu %2, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.slt %8, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.xori %9, 1 : (!riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i1
    func.return %11 : i1
  }
}

