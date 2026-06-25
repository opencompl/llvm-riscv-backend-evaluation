"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.srem"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.udiv"(%0, %0) : (i64, i64) -> i64
    %2 = "llvm.sdiv"(%arg0, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.or"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.ashr"(%arg0, %3) : (i64, i64) -> i64
    %5 = "llvm.urem"(%arg1, %3) : (i64, i64) -> i64
    %6 = "llvm.and"(%4, %5) : (i64, i64) -> i64
    "func.return"(%6) : (i64) -> ()
  }): () -> ()
}) : () -> ()
