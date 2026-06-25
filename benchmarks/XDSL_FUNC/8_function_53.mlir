builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i1
    %2 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = riscv.and %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %1 : i1 to !riscv.reg
    %6 = riscv.czero.eqz %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.czero.nez %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.or %6, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %10 = riscv.srl %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %12 = riscv.or %11, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %12 : !riscv.reg to i32
    %14 = builtin.unrealized_conversion_cast %13 : i32 to !riscv.reg
    %15 = riscv.sext.w %14 : (!riscv.reg) -> !riscv.reg
    %16 = builtin.unrealized_conversion_cast %15 : !riscv.reg to i32
    func.return %16 : i32
  }
}

