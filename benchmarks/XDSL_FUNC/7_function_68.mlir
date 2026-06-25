builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.slt %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %2 : !riscv.reg to i1
    %4 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %3 : i1 to !riscv.reg
    %7 = riscv.czero.eqz %4, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.czero.nez %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.or %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %11 = riscv.rem %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.and %11, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %12 : !riscv.reg to i1
    %14 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %15 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %16 = riscv.xor %15, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = builtin.unrealized_conversion_cast %13 : i1 to !riscv.reg
    %18 = riscv.czero.eqz %12, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = riscv.czero.nez %16, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = riscv.or %18, %19 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %21 = builtin.unrealized_conversion_cast %20 : !riscv.reg to i64
    func.return %21 : i64
  }
}

