builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i1, %arg6_2: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.zext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = riscv.xor %3, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_1 : i1 to !riscv.reg
    %7 = riscv.czero.eqz %4, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.czero.nez %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.or %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.slt %4, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %10 : !riscv.reg to i1
    %12 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %13 = builtin.unrealized_conversion_cast %11 : i1 to !riscv.reg
    %14 = riscv.czero.eqz %12, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.czero.nez %3, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = riscv.or %14, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = builtin.unrealized_conversion_cast %16 : !riscv.reg to i32
    func.return %17 : i32
  }
}

