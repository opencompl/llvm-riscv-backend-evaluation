"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i1, %arg2: i64, %arg3: i32):
    %0 = "llvm.select"(%arg1, %arg0, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %1 = "llvm.sdiv"(%arg0, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.sext"(%arg3) : (i32) -> i64
    %3 = "llvm.lshr"(%1, %2) <{isExact}> : (i64, i64) -> i64
    %4 = "llvm.lshr"(%3, %2) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %6 = "llvm.sext"(%5) : (i32) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%7) : (i1) -> ()
  }): () -> ()
}) : () -> ()
