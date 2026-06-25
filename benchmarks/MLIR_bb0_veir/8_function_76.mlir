"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.udiv"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.sdiv"(%0, %arg1) : (i64, i64) -> i64
    %2 = "llvm.trunc"(%arg2) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %3 = "llvm.select"(%2, %arg0, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.srem"(%1, %3) : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %6 = "llvm.zext"(%5) : (i32) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%7) : (i1) -> ()
  }): () -> ()
}) : () -> ()
