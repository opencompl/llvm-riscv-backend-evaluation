"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.ashr"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.srem"(%0, %arg1) : (i64, i64) -> i64
    %2 = "llvm.sdiv"(%arg2, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.or"(%0, %2) <{isDisjoint}> : (i64, i64) -> i64
    %4 = "llvm.or"(%0, %0) <{isDisjoint}> : (i64, i64) -> i64
    %5 = "llvm.sdiv"(%4, %2) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.srem"(%3, %5) : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%7) : (i1) -> ()
  }): () -> ()
}) : () -> ()
