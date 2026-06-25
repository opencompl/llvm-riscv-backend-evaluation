builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.zext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = riscv.sltu %3, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.xori %4, 1 : (!riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %5 : !riscv.reg to i1
    %7 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %9 = builtin.unrealized_conversion_cast %6 : i1 to !riscv.reg
    %10 = riscv.czero.eqz %7, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.czero.nez %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.or %10, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %14 = riscv.or %12, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %16 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %17 = riscv.sra %15, %16 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %19 = riscv.or %17, %18 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = riscv.sra %14, %19 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %21 = builtin.unrealized_conversion_cast %20 : !riscv.reg to i64
    func.return %21 : i64
  }
}

