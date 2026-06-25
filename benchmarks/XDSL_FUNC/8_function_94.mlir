builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64, %arg6_3: i32) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.div %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = riscv.slt %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %4 : !riscv.reg to i1
    %6 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %7 = riscv.sra %6, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_3 : i32 to !riscv.reg
    %9 = riscv.sext.w %8 : (!riscv.reg) -> !riscv.reg
    %10 = riscv.rem %7, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %5 : i1 to !riscv.reg
    %12 = riscv.czero.eqz %2, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.czero.nez %10, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.or %12, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %16 = riscv.rem %15, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = riscv.sra %14, %16 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = builtin.unrealized_conversion_cast %17 : !riscv.reg to i64
    func.return %18 : i64
  }
}

