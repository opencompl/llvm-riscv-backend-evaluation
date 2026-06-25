"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i32, %arg2: i64):
    %0 = "llvm.zext"(%arg1) : (i32) -> i64
    %1 = "llvm.xor"(%arg2, %arg2) : (i64, i64) -> i64
    %2 = "llvm.sdiv"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.urem"(%arg0, %2) : (i64, i64) -> i64
    %4 = "llvm.lshr"(%1, %0) : (i64, i64) -> i64
    %5 = "llvm.udiv"(%3, %4) : (i64, i64) -> i64
    "func.return"(%5) : (i64) -> ()
  }): () -> ()
}) : () -> ()
