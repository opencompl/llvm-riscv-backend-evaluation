builtin.module {
  func.func @func0(%arg6: i64, %arg6_1: i64, %arg6_2: i64) -> i64 {
    %0 = rv64.get_register : !riscv.reg
    %1 = builtin.unrealized_conversion_cast %0 : !riscv.reg to i64
    func.return %1 : i64
  }
}

