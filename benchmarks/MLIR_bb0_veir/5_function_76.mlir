"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i32):
    %0 = "llvm.or"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.zext"(%arg1) : (i32) -> i64
    %2 = "llvm.udiv"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.ashr"(%0, %2) <{isExact}> : (i64, i64) -> i64
    %4 = "llvm.trunc"(%3) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%4) : (i1) -> ()
  }): () -> ()
}) : () -> ()
