"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64):
    %0 = "llvm.srem"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.urem"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.ashr"(%arg0, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%3) : (i32) -> ()
  }): () -> ()
}) : () -> ()
