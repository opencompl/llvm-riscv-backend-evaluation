"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i1, %arg1: i64):
    %0 = "llvm.and"(%arg1, %arg1) : (i64, i64) -> i64
    %1 = "llvm.udiv"(%arg1, %0) : (i64, i64) -> i64
    %2 = "llvm.or"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.select"(%arg0, %arg1, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.trunc"(%3) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %5 = "llvm.sext"(%4) : (i32) -> i64
    %6 = "llvm.and"(%5, %arg1) : (i64, i64) -> i64
    %7 = "llvm.urem"(%5, %6) : (i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
