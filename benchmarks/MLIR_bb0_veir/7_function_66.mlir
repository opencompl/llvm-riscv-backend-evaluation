"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.sext"(%0) : (i32) -> i64
    %2 = "llvm.urem"(%1, %arg1) : (i64, i64) -> i64
    %3 = "llvm.icmp"(%1, %2) <{predicate = 7 : i64}> : (i64, i64) -> i1
    %4 = "llvm.udiv"(%arg1, %arg2) : (i64, i64) -> i64
    %5 = "llvm.urem"(%4, %arg1) : (i64, i64) -> i64
    %6 = "llvm.select"(%3, %arg1, %5) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    "func.return"(%6) : (i64) -> ()
  }): () -> ()
}) : () -> ()
