"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i32):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.zext"(%0) : (i32) -> i64
    %2 = "llvm.lshr"(%1, %arg1) : (i64, i64) -> i64
    %3 = "llvm.sext"(%arg2) : (i32) -> i64
    %4 = "llvm.srem"(%3, %arg1) : (i64, i64) -> i64
    %5 = "llvm.lshr"(%4, %3) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.ashr"(%2, %5) <{isExact}> : (i64, i64) -> i64
    "func.return"(%6) : (i64) -> ()
  }): () -> ()
}) : () -> ()
