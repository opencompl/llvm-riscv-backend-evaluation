builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i32
    %2 = builtin.unrealized_conversion_cast %1 : i32 to !riscv.reg
    %3 = riscv.sext.w %2 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %5 = riscv.remu %3, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = riscv.sltu %5, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = riscv.xori %6, 1 : (!riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %7 : !riscv.reg to i1
    %9 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %11 = riscv.divu %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %13 = riscv.remu %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %15 = builtin.unrealized_conversion_cast %8 : i1 to !riscv.reg
    %16 = riscv.czero.eqz %14, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = riscv.czero.nez %13, %15 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = riscv.or %16, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = builtin.unrealized_conversion_cast %18 : !riscv.reg to i64
    func.return %19 : i64
  }
}

