builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i1, %arg6_2: i32) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6_2 : i32 to !riscv.reg
    %1 = riscv.sext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %3 = riscv.xor %2, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = riscv.sltiu %3, 1 : (!riscv.reg) -> !riscv.reg
    %5 = builtin.unrealized_conversion_cast %4 : !riscv.reg to i1
    %6 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %7 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_1 : i1 to !riscv.reg
    %9 = riscv.czero.eqz %6, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %10 = riscv.czero.nez %7, %8 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.or %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %5 : i1 to !riscv.reg
    %13 = riscv.czero.eqz %1, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.czero.nez %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.or %13, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %17 = riscv.srl %16, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %18 = builtin.unrealized_conversion_cast %arg6_1 : i1 to !riscv.reg
    %19 = riscv.czero.eqz %15, %18 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = riscv.czero.nez %17, %18 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %21 = riscv.or %19, %20 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %22 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %23 = riscv.srl %22, %21 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %24 = builtin.unrealized_conversion_cast %23 : !riscv.reg to i1
    func.return %24 : i1
  }
}

