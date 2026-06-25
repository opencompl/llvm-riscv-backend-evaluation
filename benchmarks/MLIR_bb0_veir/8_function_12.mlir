"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.srem"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.trunc"(%arg2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %2 = "llvm.sext"(%1) : (i32) -> i64
    %3 = "llvm.lshr"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.and"(%arg0, %0) : (i64, i64) -> i64
    %5 = "llvm.sdiv"(%arg1, %4) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.lshr"(%3, %5) : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%7) : (i1) -> ()
  }): () -> ()
}) : () -> ()
