"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i32, %arg1: i64, %arg2: i64):
    %0 = "llvm.sext"(%arg0) : (i32) -> i64
    %1 = "llvm.urem"(%arg1, %arg2) : (i64, i64) -> i64
    %2 = "llvm.and"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.icmp"(%2, %1) <{predicate = 7 : i64}> : (i64, i64) -> i1
    "func.return"(%3) : (i1) -> ()
  }): () -> ()
}) : () -> ()
