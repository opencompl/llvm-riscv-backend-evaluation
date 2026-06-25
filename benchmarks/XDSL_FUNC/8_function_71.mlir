builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.or %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = riscv.slt %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %4 : !riscv.reg to i1
    %6 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %7 = builtin.unrealized_conversion_cast %5 : i1 to !riscv.reg
    %8 = riscv.czero.eqz %2, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.czero.nez %6, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.or %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i1
    %12 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i1
    %13 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %14 = riscv.srl %13, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %16 = builtin.unrealized_conversion_cast %12 : i1 to !riscv.reg
    %17 = riscv.czero.eqz %15, %16 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = riscv.czero.nez %14, %16 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = riscv.or %17, %18 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = builtin.unrealized_conversion_cast %11 : i1 to !riscv.reg
    %21 = riscv.czero.eqz %10, %20 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %22 = riscv.czero.nez %19, %20 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %23 = riscv.or %21, %22 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %24 = builtin.unrealized_conversion_cast %23 : !riscv.reg to i64
    func.return %24 : i64
  }
}

