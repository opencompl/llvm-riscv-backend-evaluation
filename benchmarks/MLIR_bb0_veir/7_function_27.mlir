"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i1, %arg2: i64):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.zext"(%0) : (i32) -> i64
    %2 = "llvm.xor"(%1, %1) : (i64, i64) -> i64
    %3 = "llvm.select"(%arg1, %2, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.icmp"(%2, %3) <{predicate = 2 : i64}> : (i64, i64) -> i1
    %5 = "llvm.select"(%4, %arg0, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%6) : (i32) -> ()
  }): () -> ()
}) : () -> ()
