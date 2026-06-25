"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.trunc"(%arg2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.zext"(%0) : (i32) -> i64
    %2 = "llvm.ashr"(%arg1, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.xor"(%arg0, %2) : (i64, i64) -> i64
    %4 = "llvm.trunc"(%3) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %5 = "llvm.zext"(%4) : (i32) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%6) : (i32) -> ()
  }): () -> ()
}) : () -> ()
