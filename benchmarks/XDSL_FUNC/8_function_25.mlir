builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i1, %arg6_2: i64, %arg6_3: i32) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_1 : i1 to !riscv.reg
    %3 = riscv.czero.eqz %0, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = riscv.czero.nez %1, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.or %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %7 = riscv.div %6, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_3 : i32 to !riscv.reg
    %9 = riscv.sext.w %8 : (!riscv.reg) -> !riscv.reg
    %10 = riscv.srl %7, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.srl %10, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %11 : !riscv.reg to i32
    %13 = builtin.unrealized_conversion_cast %12 : i32 to !riscv.reg
    %14 = riscv.sext.w %13 : (!riscv.reg) -> !riscv.reg
    %15 = builtin.unrealized_conversion_cast %14 : !riscv.reg to i1
    func.return %15 : i1
  }
}

