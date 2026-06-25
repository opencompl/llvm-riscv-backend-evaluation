builtin.module {
  func.func @func0(%arg6: i1, %arg6_1: i64, %arg6_2: i32) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6 : i1 to !riscv.reg
    %3 = riscv.czero.eqz %0, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = riscv.czero.nez %1, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.or %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_2 : i32 to !riscv.reg
    %7 = riscv.sext.w %6 : (!riscv.reg) -> !riscv.reg
    %8 = riscv.srl %5, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.remu %5, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %11 = riscv.div %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.xor %11, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.sltiu %12, 1 : (!riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %13 : !riscv.reg to i1
    func.return %14 : i1
  }
}

