"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.sext"(%0) : (i32) -> i64
    %2 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %3 = "llvm.select"(%2, %1, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.and"(%1, %3) : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%5) : (i32) -> ()
  }): () -> ()
}) : () -> ()
