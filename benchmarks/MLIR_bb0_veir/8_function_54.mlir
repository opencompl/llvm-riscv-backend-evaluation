"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i32):
    %0 = "llvm.or"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.zext"(%arg2) : (i32) -> i64
    %2 = "llvm.lshr"(%arg1, %1) : (i64, i64) -> i64
    %3 = "llvm.sext"(%arg2) : (i32) -> i64
    %4 = "llvm.urem"(%2, %3) : (i64, i64) -> i64
    %5 = "llvm.and"(%4, %3) : (i64, i64) -> i64
    %6 = "llvm.srem"(%0, %5) : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%7) : (i32) -> ()
  }): () -> ()
}) : () -> ()
