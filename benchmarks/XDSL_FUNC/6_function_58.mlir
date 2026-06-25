builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i32) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.sltu %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %2 : !riscv.reg to i1
    %4 = builtin.unrealized_conversion_cast %arg6_1 : i32 to !riscv.reg
    %5 = riscv.zext.w %4 : (!riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %5 : !riscv.reg to i32
    %7 = builtin.unrealized_conversion_cast %6 : i32 to !riscv.reg
    %8 = riscv.zext.w %7 : (!riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %10 = builtin.unrealized_conversion_cast %3 : i1 to !riscv.reg
    %11 = riscv.czero.eqz %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.czero.nez %8, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.or %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %13 : !riscv.reg to i32
    func.return %14 : i32
  }
}

