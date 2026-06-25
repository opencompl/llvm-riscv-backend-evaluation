"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.lshr"(%arg0, %arg0) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.and"(%arg1, %0) : (i64, i64) -> i64
    %2 = "llvm.xor"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.urem"(%arg2, %0) : (i64, i64) -> i64
    %4 = "llvm.sdiv"(%3, %0) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.ashr"(%2, %4) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%6) : (i1) -> ()
  }): () -> ()
}) : () -> ()
