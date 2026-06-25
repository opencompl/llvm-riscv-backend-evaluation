builtin.module {
  func.func @func0(%arg6: i32, %arg6_1: i64, %arg6_2: i64, %arg6_3: i1) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i32 to !riscv.reg
    %1 = riscv.sext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %3 = riscv.and %1, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = riscv.remu %1, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_3 : i1 to !riscv.reg
    %6 = riscv.czero.eqz %3, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.czero.nez %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.or %6, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %10 = riscv.and %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.and %10, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %13 = riscv.remu %12, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.or %13, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = builtin.unrealized_conversion_cast %14 : !riscv.reg to i64
    func.return %15 : i64
  }
}

