"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.urem"(%arg2, %arg0) : (i64, i64) -> i64
    %1 = "llvm.icmp"(%arg1, %0) <{predicate = 8 : i64}> : (i64, i64) -> i1
    %2 = "llvm.urem"(%arg2, %arg2) : (i64, i64) -> i64
    %3 = "llvm.select"(%1, %2, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.udiv"(%arg0, %3) : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%5) : (i32) -> ()
  }): () -> ()
}) : () -> ()
