"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64):
    %0 = "llvm.sdiv"(%arg0, %arg0) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %2 = "llvm.sext"(%1) : (i32) -> i64
    %3 = "llvm.sdiv"(%0, %2) <{isExact}> : (i64, i64) -> i64
    %4 = "llvm.lshr"(%arg0, %3) <{isExact}> : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%5) : (i1) -> ()
  }): () -> ()
}) : () -> ()
