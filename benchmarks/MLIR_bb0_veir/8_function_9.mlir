"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.ashr"(%arg0, %arg1) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.trunc"(%arg2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %2 = "llvm.sext"(%1) : (i32) -> i64
    %3 = "llvm.urem"(%2, %0) : (i64, i64) -> i64
    %4 = "llvm.and"(%0, %arg1) : (i64, i64) -> i64
    %5 = "llvm.udiv"(%3, %4) : (i64, i64) -> i64
    %6 = "llvm.srem"(%5, %4) : (i64, i64) -> i64
    %7 = "llvm.sdiv"(%0, %6) : (i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
