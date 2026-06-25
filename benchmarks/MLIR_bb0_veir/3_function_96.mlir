"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i32):
    %0 = "llvm.srem"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.sext"(%arg2) : (i32) -> i64
    %2 = "llvm.udiv"(%0, %1) : (i64, i64) -> i64
    "func.return"(%2) : (i64) -> ()
  }): () -> ()
}) : () -> ()
