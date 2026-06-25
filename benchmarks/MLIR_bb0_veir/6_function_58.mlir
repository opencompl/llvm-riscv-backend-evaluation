"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i32):
    %0 = "llvm.icmp"(%arg0, %arg0) <{predicate = 8 : i64}> : (i64, i64) -> i1
    %1 = "llvm.zext"(%arg1) : (i32) -> i64
    %2 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %3 = "llvm.zext"(%2) : (i32) -> i64
    %4 = "llvm.select"(%0, %arg0, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%5) : (i32) -> ()
  }): () -> ()
}) : () -> ()
