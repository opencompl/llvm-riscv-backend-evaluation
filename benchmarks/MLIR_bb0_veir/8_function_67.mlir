"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.srem"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.and"(%arg2, %arg0) : (i64, i64) -> i64
    %2 = "llvm.or"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.or"(%arg2, %2) : (i64, i64) -> i64
    %4 = "llvm.sdiv"(%0, %3) : (i64, i64) -> i64
    %5 = "llvm.and"(%3, %4) : (i64, i64) -> i64
    %6 = "llvm.or"(%0, %5) <{isDisjoint}> : (i64, i64) -> i64
    %7 = "llvm.icmp"(%6, %6) <{predicate = 9 : i64}> : (i64, i64) -> i1
    "func.return"(%7) : (i1) -> ()
  }): () -> ()
}) : () -> ()
