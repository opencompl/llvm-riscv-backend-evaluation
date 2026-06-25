"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.trunc"(%arg1) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %1 = "llvm.sdiv"(%arg2, %arg1) : (i64, i64) -> i64
    %2 = "llvm.select"(%0, %arg2, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.or"(%arg0, %2) <{isDisjoint}> : (i64, i64) -> i64
    %4 = "llvm.trunc"(%3) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%4) : (i32) -> ()
  }): () -> ()
}) : () -> ()
