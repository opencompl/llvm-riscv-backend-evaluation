"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i32):
    %0 = "llvm.zext"(%arg2) : (i32) -> i64
    %1 = "llvm.lshr"(%arg1, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.udiv"(%1, %arg0) : (i64, i64) -> i64
    %3 = "llvm.xor"(%2, %1) : (i64, i64) -> i64
    %4 = "llvm.xor"(%arg0, %3) : (i64, i64) -> i64
    %5 = "llvm.xor"(%4, %arg1) : (i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%6) : (i32) -> ()
  }): () -> ()
}) : () -> ()
