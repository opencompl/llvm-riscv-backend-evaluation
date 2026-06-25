builtin.module {
  func.func @func0(%arg6: i1, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %2 = riscv.sra %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6 : i1 to !riscv.reg
    %5 = riscv.czero.eqz %2, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.czero.nez %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.or %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %9 = riscv.sltu %2, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.xori %9, 1 : (!riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i1
    %12 = riscv.or %7, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %11 : i1 to !riscv.reg
    %14 = riscv.czero.eqz %12, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.czero.nez %2, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = riscv.or %14, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = riscv.divu %16, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = riscv.srl %7, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = builtin.unrealized_conversion_cast %18 : !riscv.reg to i64
    func.return %19 : i64
  }
}

