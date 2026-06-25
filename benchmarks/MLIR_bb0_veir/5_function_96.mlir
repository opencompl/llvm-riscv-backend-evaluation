"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.urem"(%arg1, %arg2) : (i64, i64) -> i64
    %1 = "llvm.lshr"(%0, %arg0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.and"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.srem"(%2, %arg0) : (i64, i64) -> i64
    %4 = "llvm.trunc"(%3) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%4) : (i32) -> ()
  }): () -> ()
}) : () -> ()
