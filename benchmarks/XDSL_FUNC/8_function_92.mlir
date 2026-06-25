builtin.module {
  func.func @func0(%arg6: i1, %arg6_1: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.and %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = riscv.divu %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.or %4, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6 : i1 to !riscv.reg
    %8 = riscv.czero.eqz %6, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.czero.nez %5, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.or %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i32
    %12 = builtin.unrealized_conversion_cast %11 : i32 to !riscv.reg
    %13 = riscv.sext.w %12 : (!riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %15 = riscv.and %14, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = riscv.remu %13, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = builtin.unrealized_conversion_cast %16 : !riscv.reg to i64
    func.return %17 : i64
  }
}

