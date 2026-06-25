"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.zext"(%0) : (i32) -> i64
    %2 = "llvm.icmp"(%1, %1) <{predicate = 9 : i64}> : (i64, i64) -> i1
    %3 = "llvm.select"(%2, %arg0, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.or"(%arg0, %3) : (i64, i64) -> i64
    %5 = "llvm.ashr"(%arg2, %arg2) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.or"(%arg1, %5) <{isDisjoint}> : (i64, i64) -> i64
    %7 = "llvm.ashr"(%4, %6) : (i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
