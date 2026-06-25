"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i32, %arg1: i64, %arg2: i64):
    %0 = "llvm.zext"(%arg0) : (i32) -> i64
    %1 = "llvm.xor"(%0, %arg1) : (i64, i64) -> i64
    %2 = "llvm.lshr"(%arg2, %0) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %4 = "llvm.zext"(%3) : (i32) -> i64
    %5 = "llvm.sdiv"(%1, %4) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.srem"(%0, %5) : (i64, i64) -> i64
    "func.return"(%6) : (i64) -> ()
  }): () -> ()
}) : () -> ()
