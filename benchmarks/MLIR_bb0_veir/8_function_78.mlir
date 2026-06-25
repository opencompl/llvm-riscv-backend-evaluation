"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i32, %arg1: i64, %arg2: i64, %arg3: i1):
    %0 = "llvm.zext"(%arg0) : (i32) -> i64
    %1 = "llvm.or"(%arg1, %arg2) : (i64, i64) -> i64
    %2 = "llvm.select"(%arg3, %arg1, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.select"(%arg3, %arg2, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.sdiv"(%2, %0) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.lshr"(%3, %4) : (i64, i64) -> i64
    %6 = "llvm.urem"(%1, %5) : (i64, i64) -> i64
    %7 = "llvm.udiv"(%0, %6) : (i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
