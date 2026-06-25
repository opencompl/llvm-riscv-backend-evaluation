"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i32):
    %0 = "llvm.sdiv"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.or"(%0, %arg1) : (i64, i64) -> i64
    %2 = "llvm.zext"(%arg2) : (i32) -> i64
    %3 = "llvm.srem"(%1, %2) : (i64, i64) -> i64
    %4 = "llvm.sext"(%arg2) : (i32) -> i64
    %5 = "llvm.ashr"(%4, %4) : (i64, i64) -> i64
    %6 = "llvm.udiv"(%3, %5) : (i64, i64) -> i64
    "func.return"(%6) : (i64) -> ()
  }): () -> ()
}) : () -> ()
