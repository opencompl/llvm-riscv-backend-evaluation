"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.icmp"(%arg0, %arg0) <{predicate = 9 : i64}> : (i64, i64) -> i1
    %1 = "llvm.urem"(%arg1, %arg0) : (i64, i64) -> i64
    %2 = "llvm.or"(%1, %1) <{isDisjoint}> : (i64, i64) -> i64
    %3 = "llvm.urem"(%arg2, %2) : (i64, i64) -> i64
    %4 = "llvm.select"(%0, %1, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    "func.return"(%4) : (i64) -> ()
  }): () -> ()
}) : () -> ()
