"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i32, %arg1: i64, %arg2: i64):
    %0 = "llvm.zext"(%arg0) : (i32) -> i64
    %1 = "llvm.lshr"(%0, %arg1) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.lshr"(%0, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.zext"(%arg0) : (i32) -> i64
    %4 = "llvm.xor"(%arg2, %3) : (i64, i64) -> i64
    %5 = "llvm.srem"(%1, %4) : (i64, i64) -> i64
    %6 = "llvm.or"(%2, %5) <{isDisjoint}> : (i64, i64) -> i64
    "func.return"(%6) : (i64) -> ()
  }): () -> ()
}) : () -> ()
