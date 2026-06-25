"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.and"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.trunc"(%0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %2 = "llvm.sext"(%1) : (i32) -> i64
    %3 = "llvm.lshr"(%arg2, %0) : (i64, i64) -> i64
    %4 = "llvm.sdiv"(%2, %3) <{isExact}> : (i64, i64) -> i64
    "func.return"(%4) : (i64) -> ()
  }): () -> ()
}) : () -> ()
