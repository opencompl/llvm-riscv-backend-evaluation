"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.or"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.and"(%0, %arg0) : (i64, i64) -> i64
    %2 = "llvm.trunc"(%arg1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %3 = "llvm.zext"(%2) : (i32) -> i64
    %4 = "llvm.udiv"(%3, %arg2) : (i64, i64) -> i64
    %5 = "llvm.icmp"(%1, %4) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "func.return"(%5) : (i1) -> ()
  }): () -> ()
}) : () -> ()
