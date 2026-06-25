"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i1, %arg1: i1, %arg2: i64):
    %0 = "llvm.select"(%arg1, %arg2, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %1 = "llvm.and"(%arg2, %0) : (i64, i64) -> i64
    %2 = "llvm.lshr"(%1, %0) : (i64, i64) -> i64
    %3 = "llvm.lshr"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.trunc"(%3) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %5 = "llvm.sext"(%4) : (i32) -> i64
    %6 = "llvm.select"(%arg0, %5, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%7) : (i32) -> ()
  }): () -> ()
}) : () -> ()
