"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %1 = "llvm.select"(%0, %arg0, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.sdiv"(%arg2, %arg1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.ashr"(%1, %2) <{isExact}> : (i64, i64) -> i64
    %4 = "llvm.and"(%3, %1) : (i64, i64) -> i64
    %5 = "llvm.sdiv"(%4, %arg1) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.sdiv"(%3, %5) : (i64, i64) -> i64
    %7 = "llvm.ashr"(%4, %6) <{isExact}> : (i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
