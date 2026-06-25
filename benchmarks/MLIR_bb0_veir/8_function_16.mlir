"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i32, %arg2: i64):
    %0 = "llvm.sext"(%arg1) : (i32) -> i64
    %1 = "llvm.or"(%arg0, %0) <{isDisjoint}> : (i64, i64) -> i64
    %2 = "llvm.srem"(%0, %arg2) : (i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %4 = "llvm.zext"(%3) : (i32) -> i64
    %5 = "llvm.urem"(%arg0, %4) : (i64, i64) -> i64
    %6 = "llvm.urem"(%5, %arg2) : (i64, i64) -> i64
    %7 = "llvm.sdiv"(%1, %6) <{isExact}> : (i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
