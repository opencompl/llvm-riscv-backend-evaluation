"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i32, %arg2: i64):
    %0 = "llvm.and"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.sext"(%arg1) : (i32) -> i64
    %2 = "llvm.udiv"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.and"(%2, %arg2) : (i64, i64) -> i64
    %4 = "llvm.ashr"(%3, %2) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.udiv"(%2, %4) : (i64, i64) -> i64
    %6 = "llvm.ashr"(%0, %5) : (i64, i64) -> i64
    %7 = "llvm.sdiv"(%6, %4) : (i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
