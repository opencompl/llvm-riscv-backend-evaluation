"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i32):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.sext"(%0) : (i32) -> i64
    %2 = "llvm.xor"(%1, %arg1) : (i64, i64) -> i64
    %3 = "llvm.zext"(%arg2) : (i32) -> i64
    %4 = "llvm.urem"(%3, %arg1) : (i64, i64) -> i64
    %5 = "llvm.or"(%2, %4) : (i64, i64) -> i64
    %6 = "llvm.sext"(%arg2) : (i32) -> i64
    %7 = "llvm.udiv"(%5, %6) : (i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
