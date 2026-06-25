"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.lshr"(%arg0, %arg1) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.or"(%arg1, %arg1) <{isDisjoint}> : (i64, i64) -> i64
    %2 = "llvm.udiv"(%1, %arg2) : (i64, i64) -> i64
    %3 = "llvm.xor"(%arg2, %arg0) : (i64, i64) -> i64
    %4 = "llvm.sdiv"(%3, %arg2) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.urem"(%2, %4) : (i64, i64) -> i64
    %6 = "llvm.srem"(%0, %5) : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%7) : (i1) -> ()
  }): () -> ()
}) : () -> ()
