builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.sltu %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %2 : !riscv.reg to i1
    %4 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = riscv.rem %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %8 = builtin.unrealized_conversion_cast %3 : i1 to !riscv.reg
    %9 = riscv.czero.eqz %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.czero.nez %6, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.or %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %11 : !riscv.reg to i32
    %13 = builtin.unrealized_conversion_cast %12 : i32 to !riscv.reg
    %14 = riscv.zext.w %13 : (!riscv.reg) -> !riscv.reg
    %15 = builtin.unrealized_conversion_cast %14 : !riscv.reg to i32
    func.return %15 : i32
  }
}

