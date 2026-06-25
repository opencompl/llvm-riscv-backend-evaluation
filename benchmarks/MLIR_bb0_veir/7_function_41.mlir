"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.xor"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.and"(%arg1, %0) : (i64, i64) -> i64
    %2 = "llvm.lshr"(%arg2, %1) : (i64, i64) -> i64
    %3 = "llvm.lshr"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.and"(%0, %arg2) : (i64, i64) -> i64
    %5 = "llvm.udiv"(%3, %4) : (i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%6) : (i32) -> ()
  }): () -> ()
}) : () -> ()
