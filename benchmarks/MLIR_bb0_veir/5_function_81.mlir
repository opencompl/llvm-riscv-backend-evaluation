"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.urem"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.trunc"(%arg2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %2 = "llvm.sext"(%1) : (i32) -> i64
    %3 = "llvm.and"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.icmp"(%3, %0) <{predicate = 7 : i64}> : (i64, i64) -> i1
    "func.return"(%4) : (i1) -> ()
  }): () -> ()
}) : () -> ()
