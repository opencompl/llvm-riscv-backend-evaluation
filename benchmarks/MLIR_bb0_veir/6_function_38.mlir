"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i32):
    %0 = "llvm.xor"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.urem"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.lshr"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.zext"(%arg2) : (i32) -> i64
    %4 = "llvm.and"(%2, %3) : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%5) : (i32) -> ()
  }): () -> ()
}) : () -> ()
