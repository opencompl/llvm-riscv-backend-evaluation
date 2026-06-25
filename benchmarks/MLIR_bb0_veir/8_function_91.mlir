"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.srem"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.or"(%arg0, %0) <{isDisjoint}> : (i64, i64) -> i64
    %2 = "llvm.xor"(%1, %arg0) : (i64, i64) -> i64
    %3 = "llvm.udiv"(%1, %2) : (i64, i64) -> i64
    %4 = "llvm.sdiv"(%3, %arg1) : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %6 = "llvm.sext"(%5) : (i32) -> i64
    %7 = "llvm.icmp"(%6, %1) <{predicate = 4 : i64}> : (i64, i64) -> i1
    "func.return"(%7) : (i1) -> ()
  }): () -> ()
}) : () -> ()
