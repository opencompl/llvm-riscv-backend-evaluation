"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.zext"(%0) : (i32) -> i64
    %2 = "llvm.lshr"(%1, %arg1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.srem"(%2, %arg0) : (i64, i64) -> i64
    %4 = "llvm.urem"(%1, %3) : (i64, i64) -> i64
    "func.return"(%4) : (i64) -> ()
  }): () -> ()
}) : () -> ()
