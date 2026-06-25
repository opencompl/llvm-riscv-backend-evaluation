builtin.module {
  func.func @func0(%arg6: i32, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i32 to !riscv.reg
    %1 = riscv.sext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %4 = riscv.divu %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %6 = riscv.sltu %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.xori %6, 1 : (!riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %7 : !riscv.reg to i1
    %9 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %10 = builtin.unrealized_conversion_cast %8 : i1 to !riscv.reg
    %11 = riscv.czero.eqz %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.czero.nez %4, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.or %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.and %13, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.xor %14, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = riscv.divu %14, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = builtin.unrealized_conversion_cast %16 : !riscv.reg to i64
    func.return %17 : i64
  }
}

