"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.srem"(%arg2, %arg1) : (i64, i64) -> i64
    %1 = "llvm.xor"(%arg1, %0) : (i64, i64) -> i64
    %2 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %3 = "llvm.sext"(%2) : (i32) -> i64
    %4 = "llvm.and"(%arg0, %3) : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %6 = "llvm.zext"(%5) : (i32) -> i64
    "func.return"(%6) : (i64) -> ()
  }): () -> ()
}) : () -> ()
