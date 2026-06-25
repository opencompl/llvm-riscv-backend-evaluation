"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.or"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.ashr"(%arg2, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.sdiv"(%arg2, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.icmp"(%0, %2) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "func.return"(%3) : (i1) -> ()
  }): () -> ()
}) : () -> ()
