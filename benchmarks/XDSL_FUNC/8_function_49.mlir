builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i1, %arg6_3: i32) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_2 : i1 to !riscv.reg
    %3 = riscv.czero.eqz %0, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = riscv.czero.nez %1, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = riscv.or %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_3 : i32 to !riscv.reg
    %7 = riscv.sext.w %6 : (!riscv.reg) -> !riscv.reg
    %8 = riscv.divu %5, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %10 = riscv.and %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %12 = builtin.unrealized_conversion_cast %arg6_2 : i1 to !riscv.reg
    %13 = riscv.czero.eqz %10, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.czero.nez %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.or %13, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = riscv.and %15, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %18 = riscv.and %16, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = builtin.unrealized_conversion_cast %18 : !riscv.reg to i32
    func.return %19 : i32
  }
}

