"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i32):
    %0 = "llvm.or"(%arg0, %arg1) <{isDisjoint}> : (i64, i64) -> i64
    %1 = "llvm.ashr"(%arg0, %arg0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.urem"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.zext"(%arg2) : (i32) -> i64
    %4 = "llvm.icmp"(%2, %3) <{predicate = 6 : i64}> : (i64, i64) -> i1
    "func.return"(%4) : (i1) -> ()
  }): () -> ()
}) : () -> ()
