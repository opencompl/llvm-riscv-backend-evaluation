builtin.module {
  func.func @func0(%arg6: i1, %arg6_1: i64, %arg6_2: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.sra %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = riscv.and %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %2 : !riscv.reg to i32
    %6 = builtin.unrealized_conversion_cast %5 : i32 to !riscv.reg
    %7 = riscv.zext.w %6 : (!riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6 : i1 to !riscv.reg
    %9 = riscv.czero.eqz %4, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.czero.nez %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.or %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %11 : !riscv.reg to i32
    func.return %12 : i32
  }
}

