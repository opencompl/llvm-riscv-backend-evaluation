"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64):
    %0 = "llvm.ashr"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.sdiv"(%0, %0) : (i64, i64) -> i64
    %2 = "llvm.xor"(%0, %1) : (i64, i64) -> i64
    "func.return"(%2) : (i64) -> ()
  }): () -> ()
}) : () -> ()
