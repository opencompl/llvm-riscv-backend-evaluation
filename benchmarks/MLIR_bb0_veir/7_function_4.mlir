"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.sdiv"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.lshr"(%0, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.udiv"(%1, %arg1) : (i64, i64) -> i64
    %3 = "llvm.and"(%arg2, %2) : (i64, i64) -> i64
    %4 = "llvm.ashr"(%arg2, %3) : (i64, i64) -> i64
    %5 = "llvm.and"(%arg1, %4) : (i64, i64) -> i64
    %6 = "llvm.icmp"(%arg0, %5) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "func.return"(%6) : (i1) -> ()
  }): () -> ()
}) : () -> ()
