"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32):
    %0 = "llvm.lshr"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.ashr"(%arg0, %arg2) : (i64, i64) -> i64
    %2 = "llvm.urem"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.urem"(%2, %0) : (i64, i64) -> i64
    %4 = "llvm.sdiv"(%0, %3) : (i64, i64) -> i64
    %5 = "llvm.zext"(%arg3) : (i32) -> i64
    %6 = "llvm.and"(%4, %5) : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%7) : (i32) -> ()
  }): () -> ()
}) : () -> ()
