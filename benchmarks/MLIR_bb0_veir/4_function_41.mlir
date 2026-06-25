"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.sdiv"(%arg1, %arg0) : (i64, i64) -> i64
    %1 = "llvm.srem"(%0, %arg2) : (i64, i64) -> i64
    %2 = "llvm.srem"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%3) : (i32) -> ()
  }): () -> ()
}) : () -> ()
