"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.sext"(%0) : (i32) -> i64
    %2 = "llvm.sdiv"(%arg0, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.udiv"(%arg0, %arg2) : (i64, i64) -> i64
    %4 = "llvm.lshr"(%arg1, %3) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.urem"(%1, %arg1) : (i64, i64) -> i64
    %6 = "llvm.xor"(%4, %5) : (i64, i64) -> i64
    %7 = "llvm.srem"(%2, %6) : (i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
