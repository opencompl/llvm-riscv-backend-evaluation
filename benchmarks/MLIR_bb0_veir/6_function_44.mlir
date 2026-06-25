"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.srem"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.and"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.udiv"(%1, %arg2) : (i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %4 = "llvm.sext"(%3) : (i32) -> i64
    %5 = "llvm.lshr"(%arg0, %4) : (i64, i64) -> i64
    "func.return"(%5) : (i64) -> ()
  }): () -> ()
}) : () -> ()
