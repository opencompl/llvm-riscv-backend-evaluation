"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.srem"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.ashr"(%0, %arg0) : (i64, i64) -> i64
    %2 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %3 = "llvm.zext"(%2) : (i32) -> i64
    %4 = "llvm.udiv"(%1, %arg1) : (i64, i64) -> i64
    %5 = "llvm.lshr"(%3, %4) <{isExact}> : (i64, i64) -> i64
    "func.return"(%5) : (i64) -> ()
  }): () -> ()
}) : () -> ()
