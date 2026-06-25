builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.divu %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = riscv.or %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = riscv.xor %5, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %6 : !riscv.reg to i1
    %8 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %9 = riscv.srl %2, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.slt %9, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i1
    %12 = builtin.unrealized_conversion_cast %11 : i1 to !riscv.reg
    %13 = riscv.czero.eqz %2, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.czero.nez %6, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.or %13, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %17 = builtin.unrealized_conversion_cast %7 : i1 to !riscv.reg
    %18 = riscv.czero.eqz %15, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = riscv.czero.nez %16, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = riscv.or %18, %19 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %21 = builtin.unrealized_conversion_cast %20 : !riscv.reg to i64
    func.return %21 : i64
  }
}

