"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i64):
    %0 = "llvm.select"(%arg0, %arg1, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %1 = "llvm.or"(%arg2, %0) : (i64, i64) -> i64
    %2 = "llvm.lshr"(%1, %arg1) : (i64, i64) -> i64
    %3 = "llvm.urem"(%1, %2) : (i64, i64) -> i64
    %4 = "llvm.srem"(%3, %3) : (i64, i64) -> i64
    %5 = "llvm.icmp"(%0, %4) <{predicate = 5 : i64}> : (i64, i64) -> i1
    "func.return"(%5) : (i1) -> ()
  }): () -> ()
}) : () -> ()
