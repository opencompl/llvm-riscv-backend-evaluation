"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.lshr"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.lshr"(%0, %arg0) : (i64, i64) -> i64
    %2 = "llvm.srem"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.urem"(%arg2, %1) : (i64, i64) -> i64
    %4 = "llvm.urem"(%2, %3) : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%5) : (i1) -> ()
  }): () -> ()
}) : () -> ()
