"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i32):
    %0 = "llvm.zext"(%arg0) : (i32) -> i64
    %1 = "llvm.trunc"(%0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %2 = "llvm.zext"(%1) : (i32) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%3) : (i32) -> ()
  }): () -> ()
}) : () -> ()
