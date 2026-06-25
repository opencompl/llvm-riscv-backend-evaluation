builtin.module {
  func.func @func0(%arg6: i32, %arg6_1: i64, %arg6_2: i64, %arg6_3: i1) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i32 to !riscv.reg
    %1 = riscv.zext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %3 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %4 = riscv.or %3, %2 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6_3 : i1 to !riscv.reg
    %8 = riscv.czero.eqz %5, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %9 = riscv.czero.nez %6, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.or %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %12 = builtin.unrealized_conversion_cast %arg6_3 : i1 to !riscv.reg
    %13 = riscv.czero.eqz %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.czero.nez %10, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.or %13, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = riscv.div %10, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = riscv.srl %15, %16 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = riscv.remu %4, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = riscv.divu %1, %18 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = builtin.unrealized_conversion_cast %19 : !riscv.reg to i64
    func.return %20 : i64
  }
}

