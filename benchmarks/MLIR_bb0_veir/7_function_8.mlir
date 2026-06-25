"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i64):
    %0 = "llvm.icmp"(%arg1, %arg1) <{predicate = 7 : i64}> : (i64, i64) -> i1
    %1 = "llvm.select"(%0, %arg2, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.select"(%arg0, %arg1, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.or"(%arg2, %arg1) <{isDisjoint}> : (i64, i64) -> i64
    %4 = "llvm.urem"(%1, %3) : (i64, i64) -> i64
    %5 = "llvm.or"(%4, %3) : (i64, i64) -> i64
    %6 = "llvm.icmp"(%2, %5) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "func.return"(%6) : (i1) -> ()
  }): () -> ()
}) : () -> ()
