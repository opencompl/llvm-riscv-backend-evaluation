builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i1) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.or %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i1 to !riscv.reg
    %6 = riscv.czero.eqz %3, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.czero.nez %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.or %6, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %11 = riscv.sra %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %arg6_2 : i1 to !riscv.reg
    %13 = riscv.czero.eqz %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.czero.nez %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.or %13, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = riscv.srl %8, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = riscv.xor %16, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = riscv.lui 0 : () -> !riscv.reg
    %19 = riscv.sltu %18, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = builtin.unrealized_conversion_cast %19 : !riscv.reg to i1
    func.return %20 : i1
  }
}

