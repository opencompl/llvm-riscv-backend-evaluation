builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.divu %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = riscv.and %2, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %3 : !riscv.reg to i1
    %5 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %7 = riscv.divu %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.or %3, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %11 = riscv.and %10, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %4 : i1 to !riscv.reg
    %13 = riscv.czero.eqz %8, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.czero.nez %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.or %13, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = builtin.unrealized_conversion_cast %15 : !riscv.reg to i32
    func.return %16 : i32
  }
}

