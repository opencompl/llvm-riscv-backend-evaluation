"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.ashr"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.sdiv"(%arg2, %0) : (i64, i64) -> i64
    %2 = "llvm.icmp"(%0, %1) <{predicate = 0 : i64}> : (i64, i64) -> i1
    "func.return"(%2) : (i1) -> ()
  }): () -> ()
}) : () -> ()
