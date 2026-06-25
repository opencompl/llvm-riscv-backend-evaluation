builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i1
    %2 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %4 = riscv.srl %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %6 = riscv.sra %4, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %8 = riscv.remu %7, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %11 = riscv.srl %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %13 = builtin.unrealized_conversion_cast %1 : i1 to !riscv.reg
    %14 = riscv.czero.eqz %11, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.czero.nez %12, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = riscv.or %14, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = builtin.unrealized_conversion_cast %1 : i1 to !riscv.reg
    %18 = riscv.czero.eqz %8, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = riscv.czero.nez %16, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = riscv.or %18, %19 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %21 = builtin.unrealized_conversion_cast %20 : !riscv.reg to i32
    func.return %21 : i32
  }
}

