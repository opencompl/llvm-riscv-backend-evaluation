builtin.module {
  func.func @func0(%arg6: i32, %arg6_1: i32, %arg6_2: i1) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i32 to !riscv.reg
    %1 = riscv.zext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %1 : !riscv.reg to i32
    %3 = builtin.unrealized_conversion_cast %2 : i32 to !riscv.reg
    %4 = riscv.zext.w %3 : (!riscv.reg) -> !riscv.reg
    %5 = riscv.rem %1, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_1 : i32 to !riscv.reg
    %7 = riscv.sext.w %6 : (!riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_2 : i1 to !riscv.reg
    %9 = riscv.czero.eqz %1, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.czero.nez %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.or %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.rem %7, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.rem %5, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %13 : !riscv.reg to i64
    func.return %14 : i64
  }
}

