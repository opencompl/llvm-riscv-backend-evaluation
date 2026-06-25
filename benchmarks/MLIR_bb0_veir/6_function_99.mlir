"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32):
    %0 = "llvm.icmp"(%arg2, %arg0) <{predicate = 0 : i64}> : (i64, i64) -> i1
    %1 = "llvm.sext"(%arg3) : (i32) -> i64
    %2 = "llvm.select"(%0, %1, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.urem"(%arg1, %2) : (i64, i64) -> i64
    %4 = "llvm.and"(%arg0, %3) : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%5) : (i1) -> ()
  }): () -> ()
}) : () -> ()
