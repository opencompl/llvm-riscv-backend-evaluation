builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.rem %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %4 = riscv.sltu %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.xori %4, 1 : (!riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %5 : !riscv.reg to i1
    %7 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %9 = riscv.srl %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.div %2, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %12 = builtin.unrealized_conversion_cast %6 : i1 to !riscv.reg
    %13 = riscv.czero.eqz %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.czero.nez %10, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.or %13, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %17 = riscv.remu %16, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = riscv.srl %10, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = riscv.sltu %18, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = riscv.xori %19, 1 : (!riscv.reg) -> !riscv.reg
    %21 = builtin.unrealized_conversion_cast %20 : !riscv.reg to i1
    func.return %21 : i1
  }
}

