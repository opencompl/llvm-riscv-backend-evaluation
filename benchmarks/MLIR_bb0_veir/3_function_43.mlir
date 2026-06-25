"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.sdiv"(%arg1, %arg2) : (i64, i64) -> i64
    %1 = "llvm.xor"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.and"(%1, %1) : (i64, i64) -> i64
    "func.return"(%2) : (i64) -> ()
  }): () -> ()
}) : () -> ()
