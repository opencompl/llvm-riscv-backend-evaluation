builtin.module {
  func.func @func0(%arg6: i1, %arg6_1: i64, %arg6_2: i1, %arg6_3: i32) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6_3 : i32 to !riscv.reg
    %1 = riscv.sext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_2 : i1 to !riscv.reg
    %3 = riscv.czero.eqz %1, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = riscv.czero.nez %1, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.or %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6 : i1 to !riscv.reg
    %8 = riscv.czero.eqz %6, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.czero.nez %5, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.or %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i32
    %12 = builtin.unrealized_conversion_cast %11 : i32 to !riscv.reg
    %13 = riscv.zext.w %12 : (!riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %13 : !riscv.reg to i32
    func.return %14 : i32
  }
}

