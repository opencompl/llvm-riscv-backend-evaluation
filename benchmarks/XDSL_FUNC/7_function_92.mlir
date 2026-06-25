builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.sext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %6 = riscv.and %5, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.xor %6, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %7 : !riscv.reg to i1
    %9 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %10 = builtin.unrealized_conversion_cast %8 : i1 to !riscv.reg
    %11 = riscv.czero.eqz %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.czero.nez %3, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.or %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %13 : !riscv.reg to i32
    func.return %14 : i32
  }
}

