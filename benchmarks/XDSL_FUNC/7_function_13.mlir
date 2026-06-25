builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.and %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = riscv.divu %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = riscv.sltu %5, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.xori %6, 1 : (!riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %7 : !riscv.reg to i1
    %9 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %10 = builtin.unrealized_conversion_cast %8 : i1 to !riscv.reg
    %11 = riscv.czero.eqz %4, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.czero.nez %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.or %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %13 : !riscv.reg to i32
    %15 = builtin.unrealized_conversion_cast %14 : i32 to !riscv.reg
    %16 = riscv.sext.w %15 : (!riscv.reg) -> !riscv.reg
    %17 = builtin.unrealized_conversion_cast %16 : !riscv.reg to i32
    func.return %17 : i32
  }
}

