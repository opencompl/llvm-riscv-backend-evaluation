builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.and %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = riscv.and %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %7 = riscv.slt %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %7 : !riscv.reg to i1
    %9 = builtin.unrealized_conversion_cast %8 : i1 to !riscv.reg
    %10 = riscv.czero.eqz %2, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.czero.nez %2, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.or %10, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.sltu %4, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %13 : !riscv.reg to i1
    %15 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %16 = builtin.unrealized_conversion_cast %14 : i1 to !riscv.reg
    %17 = riscv.czero.eqz %15, %16 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = riscv.czero.nez %12, %16 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = riscv.or %17, %18 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = riscv.or %19, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %21 = riscv.slt %20, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %22 = builtin.unrealized_conversion_cast %21 : !riscv.reg to i1
    func.return %22 : i1
  }
}

