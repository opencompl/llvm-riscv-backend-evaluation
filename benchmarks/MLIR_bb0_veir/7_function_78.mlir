"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i32):
    %0 = "llvm.srem"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.sext"(%arg1) : (i32) -> i64
    %2 = "llvm.udiv"(%1, %0) : (i64, i64) -> i64
    %3 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %4 = "llvm.sext"(%3) : (i32) -> i64
    %5 = "llvm.or"(%2, %4) : (i64, i64) -> i64
    %6 = "llvm.icmp"(%0, %5) <{predicate = 7 : i64}> : (i64, i64) -> i1
    "func.return"(%6) : (i1) -> ()
  }): () -> ()
}) : () -> ()
