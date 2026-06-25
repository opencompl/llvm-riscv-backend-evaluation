builtin.module {
  func.func @func0(%arg6: i1, %arg6_1: i64, %arg6_2: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6 : i1 to !riscv.reg
    %3 = riscv.czero.eqz %0, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = riscv.czero.nez %1, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.or %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %7 = builtin.unrealized_conversion_cast %6 : !riscv.reg to i1
    %8 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %9 = builtin.unrealized_conversion_cast %7 : i1 to !riscv.reg
    %10 = riscv.czero.eqz %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.czero.nez %5, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.or %10, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.or %12, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %15 = builtin.unrealized_conversion_cast %7 : i1 to !riscv.reg
    %16 = riscv.czero.eqz %14, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = riscv.czero.nez %5, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = riscv.or %16, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = riscv.div %13, %18 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = builtin.unrealized_conversion_cast %19 : !riscv.reg to i32
    func.return %20 : i32
  }
}

