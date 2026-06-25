"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.lshr"(%arg2, %arg0) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.udiv"(%arg1, %0) : (i64, i64) -> i64
    %2 = "llvm.urem"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%3) : (i1) -> ()
  }): () -> ()
}) : () -> ()
