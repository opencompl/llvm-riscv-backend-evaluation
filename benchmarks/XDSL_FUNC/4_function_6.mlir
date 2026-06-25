builtin.module {
  func.func @func0(%arg6: i1, %arg6_1: i64, %arg6_2: i32) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6_2 : i32 to !riscv.reg
    %1 = riscv.zext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %3 = riscv.srl %2, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6 : i1 to !riscv.reg
    %5 = riscv.czero.eqz %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.czero.nez %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.or %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.or %7, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %8 : !riscv.reg to i64
    func.return %9 : i64
  }
}

