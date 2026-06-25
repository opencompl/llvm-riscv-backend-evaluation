builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i1) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.sext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %5 = riscv.xor %4, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_2 : i1 to !riscv.reg
    %8 = riscv.czero.eqz %5, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.czero.nez %6, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.or %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %12 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %13 = riscv.div %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.rem %10, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %16 = riscv.or %14, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = riscv.xor %16, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = builtin.unrealized_conversion_cast %17 : !riscv.reg to i64
    func.return %18 : i64
  }
}

