"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.lshr"(%arg1, %arg1) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.sdiv"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.icmp"(%1, %arg2) <{predicate = 4 : i64}> : (i64, i64) -> i1
    %3 = "llvm.select"(%2, %arg1, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.icmp"(%1, %3) <{predicate = 3 : i64}> : (i64, i64) -> i1
    "func.return"(%4) : (i1) -> ()
  }): () -> ()
}) : () -> ()
