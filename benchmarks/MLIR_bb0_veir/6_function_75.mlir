"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i32):
    %0 = "llvm.ashr"(%arg0, %arg1) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.lshr"(%arg0, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %3 = "llvm.sext"(%2) : (i32) -> i64
    %4 = "llvm.sext"(%arg2) : (i32) -> i64
    %5 = "llvm.ashr"(%3, %4) <{isExact}> : (i64, i64) -> i64
    "func.return"(%5) : (i64) -> ()
  }): () -> ()
}) : () -> ()
