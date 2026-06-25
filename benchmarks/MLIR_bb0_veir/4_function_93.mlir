"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.and"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.xor"(%arg1, %0) : (i64, i64) -> i64
    %2 = "llvm.or"(%1, %arg0) <{isDisjoint}> : (i64, i64) -> i64
    %3 = "llvm.icmp"(%0, %2) <{predicate = 8 : i64}> : (i64, i64) -> i1
    "func.return"(%3) : (i1) -> ()
  }): () -> ()
}) : () -> ()
