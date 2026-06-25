"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.srem"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.xor"(%arg0, %arg1) : (i64, i64) -> i64
    %2 = "llvm.lshr"(%1, %arg2) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.icmp"(%0, %2) <{predicate = 4 : i64}> : (i64, i64) -> i1
    "func.return"(%3) : (i1) -> ()
  }): () -> ()
}) : () -> ()
