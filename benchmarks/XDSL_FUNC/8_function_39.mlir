builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i1, %arg6_2: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.or %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = riscv.sra %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_1 : i1 to !riscv.reg
    %8 = riscv.czero.eqz %5, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.czero.nez %6, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.or %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %12 = riscv.and %11, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.or %10, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.divu %13, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.or %14, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = builtin.unrealized_conversion_cast %15 : !riscv.reg to i32
    func.return %16 : i32
  }
}

