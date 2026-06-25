"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.or"(%arg0, %arg1) <{isDisjoint}> : (i64, i64) -> i64
    %1 = "llvm.udiv"(%arg0, %arg2) : (i64, i64) -> i64
    %2 = "llvm.sdiv"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.ashr"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.lshr"(%arg0, %3) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%5) : (i1) -> ()
  }): () -> ()
}) : () -> ()
