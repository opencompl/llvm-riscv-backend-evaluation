"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i32, %arg1: i64, %arg2: i64):
    %0 = "llvm.zext"(%arg0) : (i32) -> i64
    %1 = "llvm.xor"(%arg1, %0) : (i64, i64) -> i64
    %2 = "llvm.xor"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.or"(%arg2, %0) <{isDisjoint}> : (i64, i64) -> i64
    %4 = "llvm.icmp"(%2, %3) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "func.return"(%4) : (i1) -> ()
  }): () -> ()
}) : () -> ()
