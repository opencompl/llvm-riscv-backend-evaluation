"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i32):
    %0 = "llvm.sext"(%arg0) : (i32) -> i64
    %1 = "llvm.srem"(%0, %0) : (i64, i64) -> i64
    %2 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%2) : (i32) -> ()
  }): () -> ()
}) : () -> ()
