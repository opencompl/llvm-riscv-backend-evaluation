"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.xor"(%arg2, %arg0) : (i64, i64) -> i64
    %1 = "llvm.lshr"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.srem"(%arg1, %1) : (i64, i64) -> i64
    %3 = "llvm.srem"(%2, %0) : (i64, i64) -> i64
    %4 = "llvm.lshr"(%arg0, %3) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%5) : (i32) -> ()
  }): () -> ()
}) : () -> ()
