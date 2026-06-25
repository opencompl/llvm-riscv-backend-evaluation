builtin.module {
  func.func @func0(%arg6: i1, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6 : i1 to !riscv.reg
    %3 = riscv.czero.eqz %0, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = riscv.czero.nez %1, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.or %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %8 = riscv.and %7, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.sra %5, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %9 : !riscv.reg to i32
    %11 = builtin.unrealized_conversion_cast %10 : i32 to !riscv.reg
    %12 = riscv.sext.w %11 : (!riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %14 = riscv.or %13, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.or %14, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = builtin.unrealized_conversion_cast %15 : !riscv.reg to i64
    func.return %16 : i64
  }
}

