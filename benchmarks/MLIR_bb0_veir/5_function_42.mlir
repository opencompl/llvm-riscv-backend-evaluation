"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.ashr"(%arg0, %arg0) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.xor"(%0, %arg0) : (i64, i64) -> i64
    %2 = "llvm.or"(%0, %1) <{isDisjoint}> : (i64, i64) -> i64
    %3 = "llvm.udiv"(%arg1, %arg2) : (i64, i64) -> i64
    %4 = "llvm.icmp"(%2, %3) <{predicate = 0 : i64}> : (i64, i64) -> i1
    "func.return"(%4) : (i1) -> ()
  }): () -> ()
}) : () -> ()
