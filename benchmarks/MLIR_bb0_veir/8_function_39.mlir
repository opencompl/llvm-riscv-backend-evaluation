"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i1, %arg2: i64):
    %0 = "llvm.or"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.ashr"(%arg0, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.select"(%arg1, %arg2, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.and"(%2, %arg0) : (i64, i64) -> i64
    %4 = "llvm.or"(%3, %2) <{isDisjoint}> : (i64, i64) -> i64
    %5 = "llvm.udiv"(%4, %4) : (i64, i64) -> i64
    %6 = "llvm.or"(%1, %5) <{isDisjoint}> : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%7) : (i32) -> ()
  }): () -> ()
}) : () -> ()
