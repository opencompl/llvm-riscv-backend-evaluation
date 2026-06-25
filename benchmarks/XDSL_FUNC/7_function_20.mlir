builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.remu %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = riscv.slt %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.xori %4, 1 : (!riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %5 : !riscv.reg to i1
    %7 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %9 = riscv.remu %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.rem %2, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %12 = builtin.unrealized_conversion_cast %6 : i1 to !riscv.reg
    %13 = riscv.czero.eqz %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.czero.nez %10, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.or %13, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = riscv.div %2, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %18 = riscv.srl %17, %16 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = builtin.unrealized_conversion_cast %18 : !riscv.reg to i64
    func.return %19 : i64
  }
}

