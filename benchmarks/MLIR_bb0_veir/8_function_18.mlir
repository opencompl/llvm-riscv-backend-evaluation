"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.zext"(%0) : (i32) -> i64
    %2 = "llvm.lshr"(%arg1, %arg2) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.urem"(%1, %2) : (i64, i64) -> i64
    %4 = "llvm.lshr"(%1, %3) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.trunc"(%arg2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %6 = "llvm.zext"(%5) : (i32) -> i64
    %7 = "llvm.icmp"(%4, %6) <{predicate = 6 : i64}> : (i64, i64) -> i1
    "func.return"(%7) : (i1) -> ()
  }): () -> ()
}) : () -> ()
