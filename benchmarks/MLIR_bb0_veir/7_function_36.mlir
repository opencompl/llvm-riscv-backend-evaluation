"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i64):
    %0 = "llvm.ashr"(%arg1, %arg2) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.select"(%arg0, %0, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.icmp"(%arg1, %0) <{predicate = 7 : i64}> : (i64, i64) -> i1
    %3 = "llvm.or"(%1, %1) : (i64, i64) -> i64
    %4 = "llvm.select"(%2, %3, %0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.udiv"(%4, %3) : (i64, i64) -> i64
    %6 = "llvm.lshr"(%1, %5) <{isExact}> : (i64, i64) -> i64
    "func.return"(%6) : (i64) -> ()
  }): () -> ()
}) : () -> ()
