"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i32):
    %0 = "llvm.udiv"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.ashr"(%0, %arg0) : (i64, i64) -> i64
    %2 = "llvm.zext"(%arg1) : (i32) -> i64
    %3 = "llvm.xor"(%1, %2) : (i64, i64) -> i64
    "func.return"(%3) : (i64) -> ()
  }): () -> ()
}) : () -> ()
