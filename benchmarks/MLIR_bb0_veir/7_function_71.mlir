"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.urem"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.srem"(%arg1, %arg2) : (i64, i64) -> i64
    %2 = "llvm.udiv"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.or"(%2, %arg2) : (i64, i64) -> i64
    %4 = "llvm.xor"(%0, %3) : (i64, i64) -> i64
    %5 = "llvm.xor"(%arg2, %arg1) : (i64, i64) -> i64
    %6 = "llvm.srem"(%4, %5) : (i64, i64) -> i64
    "func.return"(%6) : (i64) -> ()
  }): () -> ()
}) : () -> ()
