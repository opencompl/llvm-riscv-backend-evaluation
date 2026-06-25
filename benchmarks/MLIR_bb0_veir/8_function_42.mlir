"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.sdiv"(%arg0, %arg1) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.trunc"(%0) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %2 = "llvm.lshr"(%0, %arg2) : (i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %4 = "llvm.zext"(%3) : (i32) -> i64
    %5 = "llvm.srem"(%0, %4) : (i64, i64) -> i64
    %6 = "llvm.lshr"(%5, %2) <{isExact}> : (i64, i64) -> i64
    %7 = "llvm.select"(%1, %arg2, %6) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
