builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i1) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = riscv.remu %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = riscv.remu %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_2 : i1 to !riscv.reg
    %7 = riscv.czero.eqz %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.czero.nez %2, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.or %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.xor %4, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.div %10, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.xor %11, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %12 : !riscv.reg to i32
    func.return %13 : i32
  }
}

