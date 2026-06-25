builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.sra %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %4 = riscv.sltu %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.xori %4, 1 : (!riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %5 : !riscv.reg to i1
    %7 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %9 = riscv.remu %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %11 = builtin.unrealized_conversion_cast %6 : i1 to !riscv.reg
    %12 = riscv.czero.eqz %10, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.czero.nez %9, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.or %12, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %16 = riscv.divu %15, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = riscv.sra %14, %16 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = riscv.divu %14, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = riscv.sltu %14, %18 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = builtin.unrealized_conversion_cast %19 : !riscv.reg to i1
    func.return %20 : i1
  }
}

