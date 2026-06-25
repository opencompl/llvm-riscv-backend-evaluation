"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.or"(%arg0, %arg1) <{isDisjoint}> : (i64, i64) -> i64
    %1 = "llvm.or"(%0, %arg0) <{isDisjoint}> : (i64, i64) -> i64
    %2 = "llvm.and"(%arg2, %1) : (i64, i64) -> i64
    %3 = "llvm.xor"(%2, %arg1) : (i64, i64) -> i64
    %4 = "llvm.and"(%0, %3) : (i64, i64) -> i64
    %5 = "llvm.srem"(%4, %0) : (i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%6) : (i1) -> ()
  }): () -> ()
}) : () -> ()
