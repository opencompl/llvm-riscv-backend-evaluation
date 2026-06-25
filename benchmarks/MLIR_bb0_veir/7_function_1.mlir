"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i32):
    %0 = "llvm.srem"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.zext"(%arg2) : (i32) -> i64
    %2 = "llvm.sdiv"(%1, %arg0) : (i64, i64) -> i64
    %3 = "llvm.lshr"(%0, %2) <{isExact}> : (i64, i64) -> i64
    %4 = "llvm.trunc"(%3) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %5 = "llvm.zext"(%4) : (i32) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%6) : (i1) -> ()
  }): () -> ()
}) : () -> ()
