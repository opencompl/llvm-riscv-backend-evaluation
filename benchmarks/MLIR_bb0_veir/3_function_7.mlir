"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.lshr"(%arg2, %arg2) : (i64, i64) -> i64
    %1 = "llvm.lshr"(%arg1, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.lshr"(%arg0, %1) : (i64, i64) -> i64
    "func.return"(%2) : (i64) -> ()
  }): () -> ()
}) : () -> ()
