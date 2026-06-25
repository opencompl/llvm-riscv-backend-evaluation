"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i1, %arg2: i64):
    %0 = "llvm.select"(%arg1, %arg2, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %1 = "llvm.trunc"(%0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %2 = "llvm.sext"(%1) : (i32) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %4 = "llvm.sext"(%3) : (i32) -> i64
    %5 = "llvm.and"(%4, %2) : (i64, i64) -> i64
    %6 = "llvm.icmp"(%arg0, %5) <{predicate = 6 : i64}> : (i64, i64) -> i1
    "func.return"(%6) : (i1) -> ()
  }): () -> ()
}) : () -> ()
