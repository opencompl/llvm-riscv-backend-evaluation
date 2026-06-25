"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.udiv"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.or"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.xor"(%1, %arg2) : (i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %4 = "llvm.lshr"(%0, %arg2) : (i64, i64) -> i64
    %5 = "llvm.icmp"(%4, %2) <{predicate = 2 : i64}> : (i64, i64) -> i1
    %6 = "llvm.select"(%5, %0, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %7 = "llvm.select"(%3, %6, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
