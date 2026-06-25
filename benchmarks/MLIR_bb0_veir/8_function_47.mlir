"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i32, %arg1: i64, %arg2: i64):
    %0 = "llvm.sext"(%arg0) : (i32) -> i64
    %1 = "llvm.trunc"(%0) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %2 = "llvm.srem"(%0, %0) : (i64, i64) -> i64
    %3 = "llvm.select"(%1, %2, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.xor"(%arg1, %arg1) : (i64, i64) -> i64
    %5 = "llvm.udiv"(%4, %arg2) : (i64, i64) -> i64
    %6 = "llvm.srem"(%3, %5) : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%7) : (i1) -> ()
  }): () -> ()
}) : () -> ()
