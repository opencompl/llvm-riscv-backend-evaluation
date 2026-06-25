"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i32, %arg2: i64):
    %0 = "llvm.sext"(%arg1) : (i32) -> i64
    %1 = "llvm.icmp"(%arg0, %0) <{predicate = 7 : i64}> : (i64, i64) -> i1
    %2 = "llvm.srem"(%arg2, %0) : (i64, i64) -> i64
    %3 = "llvm.sdiv"(%arg2, %2) : (i64, i64) -> i64
    %4 = "llvm.lshr"(%arg0, %3) : (i64, i64) -> i64
    %5 = "llvm.select"(%1, %3, %4) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%6) : (i32) -> ()
  }): () -> ()
}) : () -> ()
