"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.sext"(%0) : (i32) -> i64
    %2 = "llvm.ashr"(%1, %arg0) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.or"(%arg2, %1) : (i64, i64) -> i64
    %4 = "llvm.sdiv"(%1, %3) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.udiv"(%arg1, %4) : (i64, i64) -> i64
    %6 = "llvm.icmp"(%2, %5) <{predicate = 3 : i64}> : (i64, i64) -> i1
    "func.return"(%6) : (i1) -> ()
  }): () -> ()
}) : () -> ()
