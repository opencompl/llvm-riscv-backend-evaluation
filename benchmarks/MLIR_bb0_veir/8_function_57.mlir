"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.and"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.and"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.icmp"(%arg1, %arg2) <{predicate = 2 : i64}> : (i64, i64) -> i1
    %3 = "llvm.select"(%2, %0, %0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.icmp"(%3, %1) <{predicate = 8 : i64}> : (i64, i64) -> i1
    %5 = "llvm.select"(%4, %arg0, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %6 = "llvm.or"(%3, %5) : (i64, i64) -> i64
    %7 = "llvm.icmp"(%1, %6) <{predicate = 4 : i64}> : (i64, i64) -> i1
    "func.return"(%7) : (i1) -> ()
  }): () -> ()
}) : () -> ()
