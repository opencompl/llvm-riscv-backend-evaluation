"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.urem"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.urem"(%0, %arg2) : (i64, i64) -> i64
    %2 = "llvm.lshr"(%1, %0) : (i64, i64) -> i64
    %3 = "llvm.trunc"(%arg1) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %4 = "llvm.select"(%3, %2, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.urem"(%2, %4) : (i64, i64) -> i64
    %6 = "llvm.and"(%1, %5) : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%7) : (i1) -> ()
  }): () -> ()
}) : () -> ()
