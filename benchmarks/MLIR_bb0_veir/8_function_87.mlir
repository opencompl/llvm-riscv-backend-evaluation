"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i32, %arg1: i64, %arg2: i64):
    %0 = "llvm.sext"(%arg0) : (i32) -> i64
    %1 = "llvm.urem"(%0, %arg1) : (i64, i64) -> i64
    %2 = "llvm.lshr"(%1, %arg1) : (i64, i64) -> i64
    %3 = "llvm.trunc"(%arg2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %4 = "llvm.zext"(%3) : (i32) -> i64
    %5 = "llvm.ashr"(%2, %4) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %7 = "llvm.sext"(%6) : (i32) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
