"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.zext"(%0) : (i32) -> i64
    %2 = "llvm.srem"(%1, %arg2) : (i64, i64) -> i64
    %3 = "llvm.or"(%arg1, %2) : (i64, i64) -> i64
    %4 = "llvm.sext"(%0) : (i32) -> i64
    %5 = "llvm.and"(%3, %4) : (i64, i64) -> i64
    %6 = "llvm.udiv"(%1, %5) : (i64, i64) -> i64
    "func.return"(%6) : (i64) -> ()
  }): () -> ()
}) : () -> ()
