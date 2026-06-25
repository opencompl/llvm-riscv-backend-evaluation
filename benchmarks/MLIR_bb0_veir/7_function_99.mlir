"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.sdiv"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.and"(%arg1, %arg2) : (i64, i64) -> i64
    %2 = "llvm.sdiv"(%0, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %4 = "llvm.trunc"(%0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %5 = "llvm.sext"(%4) : (i32) -> i64
    %6 = "llvm.select"(%3, %arg1, %5) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    "func.return"(%6) : (i64) -> ()
  }): () -> ()
}) : () -> ()
