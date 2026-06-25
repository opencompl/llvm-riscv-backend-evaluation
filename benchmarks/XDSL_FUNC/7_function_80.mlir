builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.xor %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = riscv.sltiu %2, 1 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %3 : !riscv.reg to i1
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %7 = riscv.divu %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %9 = builtin.unrealized_conversion_cast %4 : i1 to !riscv.reg
    %10 = riscv.czero.eqz %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.czero.nez %7, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.or %10, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %14 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %15 = riscv.or %14, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %17 = riscv.sltu %16, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = builtin.unrealized_conversion_cast %17 : !riscv.reg to i1
    %19 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %20 = builtin.unrealized_conversion_cast %18 : i1 to !riscv.reg
    %21 = riscv.czero.eqz %12, %20 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %22 = riscv.czero.nez %19, %20 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %23 = riscv.or %21, %22 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %24 = riscv.sra %12, %23 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %25 = builtin.unrealized_conversion_cast %24 : !riscv.reg to i64
    func.return %25 : i64
  }
}

