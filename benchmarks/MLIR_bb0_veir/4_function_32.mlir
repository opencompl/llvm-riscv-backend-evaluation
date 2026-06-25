"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i1, %arg2: i32):
    %0 = "llvm.sext"(%arg2) : (i32) -> i64
    %1 = "llvm.select"(%arg1, %0, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.urem"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%3) : (i1) -> ()
  }): () -> ()
}) : () -> ()
