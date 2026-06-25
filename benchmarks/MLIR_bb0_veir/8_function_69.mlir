"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.srem"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.udiv"(%arg2, %arg2) : (i64, i64) -> i64
    %2 = "llvm.sdiv"(%0, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.srem"(%0, %0) : (i64, i64) -> i64
    %4 = "llvm.or"(%1, %3) <{isDisjoint}> : (i64, i64) -> i64
    %5 = "llvm.sdiv"(%1, %4) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.sdiv"(%5, %arg2) <{isExact}> : (i64, i64) -> i64
    %7 = "llvm.srem"(%2, %6) : (i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
