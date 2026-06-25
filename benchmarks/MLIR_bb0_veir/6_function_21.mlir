"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i32):
    %0 = "llvm.sext"(%arg2) : (i32) -> i64
    %1 = "llvm.select"(%arg0, %arg1, %0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.sdiv"(%0, %0) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.xor"(%1, %2) : (i64, i64) -> i64
    %4 = "llvm.xor"(%arg1, %2) : (i64, i64) -> i64
    %5 = "llvm.or"(%3, %4) : (i64, i64) -> i64
    "func.return"(%5) : (i64) -> ()
  }): () -> ()
}) : () -> ()
