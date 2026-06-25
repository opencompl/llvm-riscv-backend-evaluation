"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i32, %arg2: i64):
    %0 = "llvm.zext"(%arg1) : (i32) -> i64
    %1 = "llvm.srem"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.lshr"(%arg2, %arg2) : (i64, i64) -> i64
    %3 = "llvm.sdiv"(%arg2, %2) : (i64, i64) -> i64
    %4 = "llvm.ashr"(%1, %3) : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%5) : (i1) -> ()
  }): () -> ()
}) : () -> ()
