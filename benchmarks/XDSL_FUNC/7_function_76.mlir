builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64, %arg6_3: i1) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.divu %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = riscv.divu %2, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %5 = riscv.divu %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %7 = riscv.or %6, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6_3 : i1 to !riscv.reg
    %10 = riscv.czero.eqz %2, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.czero.nez %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.or %10, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.or %12, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %13 : !riscv.reg to i32
    func.return %14 : i32
  }
}

