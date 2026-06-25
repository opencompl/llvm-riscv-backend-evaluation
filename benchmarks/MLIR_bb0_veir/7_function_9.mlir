"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.xor"(%arg1, %arg2) : (i64, i64) -> i64
    %1 = "llvm.and"(%arg1, %0) : (i64, i64) -> i64
    %2 = "llvm.urem"(%1, %arg1) : (i64, i64) -> i64
    %3 = "llvm.lshr"(%arg0, %2) : (i64, i64) -> i64
    %4 = "llvm.or"(%arg0, %3) : (i64, i64) -> i64
    %5 = "llvm.urem"(%arg0, %4) : (i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%6) : (i1) -> ()
  }): () -> ()
}) : () -> ()
