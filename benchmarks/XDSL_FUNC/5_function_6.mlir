builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i1) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.rem %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i1 to !riscv.reg
    %4 = riscv.czero.eqz %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.czero.nez %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.or %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %6 : !riscv.reg to i32
    %8 = builtin.unrealized_conversion_cast %7 : i32 to !riscv.reg
    %9 = riscv.sext.w %8 : (!riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %11 = riscv.xor %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.sltiu %11, 1 : (!riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %12 : !riscv.reg to i1
    func.return %13 : i1
  }
}

