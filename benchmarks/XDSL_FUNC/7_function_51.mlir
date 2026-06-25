builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64, %arg6_3: i1) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.or %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_3 : i1 to !riscv.reg
    %6 = riscv.czero.eqz %3, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.czero.nez %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.or %6, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_3 : i1 to !riscv.reg
    %11 = riscv.czero.eqz %8, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.czero.nez %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.or %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.divu %13, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %16 = riscv.xor %14, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %18 = riscv.divu %17, %16 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = riscv.sltu %2, %18 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = riscv.xori %19, 1 : (!riscv.reg) -> !riscv.reg
    %21 = builtin.unrealized_conversion_cast %20 : !riscv.reg to i1
    func.return %21 : i1
  }
}

