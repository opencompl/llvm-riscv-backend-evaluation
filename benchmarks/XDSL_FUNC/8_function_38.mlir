builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64, %arg6_3: i32) -> i64 {
    %0 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %1 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %2 = riscv.sltu %1, %0 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %3 = riscv.xori %2, 1 : (!riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %3 : !riscv.reg to i1
    %5 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %7 = riscv.or %6, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6_2 : i64 to !riscv.reg
    %10 = riscv.divu %8, %9 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %11 = riscv.xor %10, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %13 = riscv.xor %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.and %13, %11 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = builtin.unrealized_conversion_cast %arg6_3 : i32 to !riscv.reg
    %16 = riscv.zext.w %15 : (!riscv.reg) -> !riscv.reg
    %17 = builtin.unrealized_conversion_cast %4 : i1 to !riscv.reg
    %18 = riscv.czero.eqz %14, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %19 = riscv.czero.nez %16, %17 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %20 = riscv.or %18, %19 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %21 = builtin.unrealized_conversion_cast %20 : !riscv.reg to i64
    func.return %21 : i64
  }
}

