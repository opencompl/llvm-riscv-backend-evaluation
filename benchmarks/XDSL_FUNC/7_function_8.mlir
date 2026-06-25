builtin.module {
  func.func @func0(%arg6: i1, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.sltu %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = riscv.xori %2, 1 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %3 : !riscv.reg to i1
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %7 = builtin.unrealized_conversion_cast %4 : i1 to !riscv.reg
    %8 = riscv.czero.eqz %5, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.czero.nez %6, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.or %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %12 = builtin.unrealized_conversion_cast %arg6 : i1 to !riscv.reg
    %13 = riscv.czero.eqz %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.czero.nez %10, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.or %13, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %17 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %18 = riscv.or %17, %16 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = riscv.remu %10, %18 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = riscv.or %18, %19 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %21 = riscv.xor %20, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %22 = riscv.lui 0 : () -> !riscv.reg
    %23 = riscv.sltu %22, %21 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %24 = builtin.unrealized_conversion_cast %23 : !riscv.reg to i1
    func.return %24 : i1
  }
}

