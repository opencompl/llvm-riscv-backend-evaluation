builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i1, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_1 : i1 to !riscv.reg
    %3 = riscv.czero.eqz %0, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = riscv.czero.nez %1, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.or %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %7 = riscv.sra %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %9 = riscv.and %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %12 = riscv.srl %10, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.sra %9, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %13 : !riscv.reg to i32
    %15 = builtin.unrealized_conversion_cast %14 : i32 to !riscv.reg
    %16 = riscv.sext.w %15 : (!riscv.reg) -> !riscv.reg
    %17 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %18 = riscv.remu %17, %16 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = builtin.unrealized_conversion_cast %18 : !riscv.reg to i64
    func.return %19 : i64
  }
}

