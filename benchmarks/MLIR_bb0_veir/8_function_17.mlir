"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i32, %arg1: i64, %arg2: i64):
    %0 = "llvm.zext"(%arg0) : (i32) -> i64
    %1 = "llvm.urem"(%0, %arg1) : (i64, i64) -> i64
    %2 = "llvm.urem"(%arg1, %0) : (i64, i64) -> i64
    %3 = "llvm.sdiv"(%arg2, %0) <{isExact}> : (i64, i64) -> i64
    %4 = "llvm.and"(%2, %3) : (i64, i64) -> i64
    %5 = "llvm.xor"(%arg1, %4) : (i64, i64) -> i64
    %6 = "llvm.ashr"(%1, %5) : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%7) : (i32) -> ()
  }): () -> ()
}) : () -> ()
