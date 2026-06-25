builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64, %arg6_3: i32) -> i32 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.sra %0, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %4 = riscv.remu %2, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %6 = riscv.sltu %5, %4 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %7 = builtin.unrealized_conversion_cast %6 : !riscv.reg to i1
    %8 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %9 = riscv.div %8, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %11 = builtin.unrealized_conversion_cast %7 : i1 to !riscv.reg
    %12 = riscv.czero.eqz %10, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.czero.nez %9, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.or %12, %13 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = builtin.unrealized_conversion_cast %arg6_3 : i32 to !riscv.reg
    %16 = riscv.zext.w %15 : (!riscv.reg) -> !riscv.reg
    %17 = riscv.and %16, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = builtin.unrealized_conversion_cast %17 : !riscv.reg to i32
    func.return %18 : i32
  }
}

