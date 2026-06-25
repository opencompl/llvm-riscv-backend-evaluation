"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i32):
    %0 = "llvm.zext"(%arg2) : (i32) -> i64
    %1 = "llvm.lshr"(%arg1, %0) : (i64, i64) -> i64
    %2 = "llvm.select"(%arg0, %1, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.or"(%2, %2) <{isDisjoint}> : (i64, i64) -> i64
    "func.return"(%3) : (i64) -> ()
  }): () -> ()
}) : () -> ()
