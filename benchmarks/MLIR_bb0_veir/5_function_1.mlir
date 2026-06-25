"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i32):
    %0 = "llvm.zext"(%arg0) : (i32) -> i64
    %1 = "llvm.ashr"(%0, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.zext"(%arg0) : (i32) -> i64
    %3 = "llvm.urem"(%1, %2) : (i64, i64) -> i64
    %4 = "llvm.trunc"(%3) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%4) : (i1) -> ()
  }): () -> ()
}) : () -> ()
