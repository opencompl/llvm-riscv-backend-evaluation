builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i32, %arg6_3: i1) -> i1 {
    %0 = builtin.unrealized_conversion_cast %arg6_2 : i32 to !riscv.reg
    %1 = riscv.sext.w %0 : (!riscv.reg) -> !riscv.reg
    %2 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %3 = riscv.sra %2, %1 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %4 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %5 = riscv.divu %4, %3 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %6 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %7 = riscv.remu %5, %6 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %8 = builtin.unrealized_conversion_cast %arg6_1 : i64 to !riscv.reg
    %9 = builtin.unrealized_conversion_cast %arg6 : i64 to !riscv.reg
    %10 = builtin.unrealized_conversion_cast %arg6_3 : i1 to !riscv.reg
    %11 = riscv.czero.eqz %8, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %12 = riscv.czero.nez %9, %10 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %13 = riscv.or %11, %12 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %14 = riscv.srl %13, %7 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %15 = riscv.remu %7, %14 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %16 = riscv.sltu %15, %5 : (!riscv.reg, !riscv.reg) -> !riscv.reg
    %17 = riscv.xori %16, 1 : (!riscv.reg) -> !riscv.reg
    %18 = builtin.unrealized_conversion_cast %17 : !riscv.reg to i1
    func.return %18 : i1
  }
}

