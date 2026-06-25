"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.sdiv"(%arg1, %arg1) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.udiv"(%arg2, %0) : (i64, i64) -> i64
    %2 = "llvm.ashr"(%arg1, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.icmp"(%arg0, %2) <{predicate = 4 : i64}> : (i64, i64) -> i1
    "func.return"(%3) : (i1) -> ()
  }): () -> ()
}) : () -> ()
