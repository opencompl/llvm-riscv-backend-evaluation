"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1):
    %0 = "llvm.or"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.select"(%arg3, %arg1, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.select"(%arg3, %1, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.udiv"(%2, %1) : (i64, i64) -> i64
    %4 = "llvm.xor"(%arg2, %3) : (i64, i64) -> i64
    %5 = "llvm.udiv"(%arg2, %4) : (i64, i64) -> i64
    %6 = "llvm.icmp"(%0, %5) <{predicate = 9 : i64}> : (i64, i64) -> i1
    "func.return"(%6) : (i1) -> ()
  }): () -> ()
}) : () -> ()
