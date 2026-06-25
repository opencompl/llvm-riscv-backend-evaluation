"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32):
    %0 = "llvm.or"(%arg0, %arg1) <{isDisjoint}> : (i64, i64) -> i64
    %1 = "llvm.and"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.xor"(%1, %arg2) : (i64, i64) -> i64
    %3 = "llvm.and"(%arg1, %arg1) : (i64, i64) -> i64
    %4 = "llvm.zext"(%arg3) : (i32) -> i64
    %5 = "llvm.and"(%4, %arg0) : (i64, i64) -> i64
    %6 = "llvm.or"(%3, %5) : (i64, i64) -> i64
    %7 = "llvm.icmp"(%2, %6) <{predicate = 0 : i64}> : (i64, i64) -> i1
    "func.return"(%7) : (i1) -> ()
  }): () -> ()
}) : () -> ()
