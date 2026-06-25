builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.sltu %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %2 : !riscv.reg to i1
    %4 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %3 : i1 to !riscv.reg
    %7 = riscv.czero.eqz %4, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = riscv.czero.nez %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.or %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %12 = riscv.divu %10, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.div %9, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %15 = riscv.div %13, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = builtin.unrealized_conversion_cast %15 : !riscv.reg to i32
    %17 = builtin.unrealized_conversion_cast %16 : i32 to !riscv.reg
    %18 = riscv.zext.w %17 : (!riscv.reg) -> !riscv.reg
    %19 = builtin.unrealized_conversion_cast %18 : !riscv.reg to i1
    func.return %19 : i1
  }
}

