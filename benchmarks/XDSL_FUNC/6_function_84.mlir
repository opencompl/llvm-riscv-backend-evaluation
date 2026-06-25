builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64, %arg6_3: i32) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.srl %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = riscv.div %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = riscv.srl %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_3 : i32 to !riscv.reg
    %8 = riscv.sext.w %7 : (!riscv.reg) -> !riscv.reg
    %9 = riscv.sltu %8, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.xori %9, 1 : (!riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i1
    %12 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %13 = builtin.unrealized_conversion_cast %11 : i1 to !riscv.reg
    %14 = riscv.czero.eqz %6, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.czero.nez %12, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = riscv.or %14, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = builtin.unrealized_conversion_cast %16 : !riscv.reg to i64
    func.return %17 : i64
  }
}

