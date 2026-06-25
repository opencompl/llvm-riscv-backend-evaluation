"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.urem"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.sdiv"(%arg2, %arg2) : (i64, i64) -> i64
    %2 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %3 = "llvm.select"(%2, %arg2, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.sdiv"(%0, %3) : (i64, i64) -> i64
    %5 = "llvm.lshr"(%4, %1) <{isExact}> : (i64, i64) -> i64
    "func.return"(%5) : (i64) -> ()
  }): () -> ()
}) : () -> ()
