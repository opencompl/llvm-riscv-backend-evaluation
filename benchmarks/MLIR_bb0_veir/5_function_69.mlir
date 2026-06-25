"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.or"(%arg1, %arg2) : (i64, i64) -> i64
    %1 = "llvm.or"(%arg2, %arg1) : (i64, i64) -> i64
    %2 = "llvm.sdiv"(%0, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.and"(%2, %arg1) : (i64, i64) -> i64
    %4 = "llvm.icmp"(%arg0, %3) <{predicate = 8 : i64}> : (i64, i64) -> i1
    "func.return"(%4) : (i1) -> ()
  }): () -> ()
}) : () -> ()
