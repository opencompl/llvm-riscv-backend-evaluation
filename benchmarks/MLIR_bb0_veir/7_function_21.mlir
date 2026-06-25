"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i32, %arg1: i64, %arg2: i64):
    %0 = "llvm.sext"(%arg0) : (i32) -> i64
    %1 = "llvm.udiv"(%arg1, %arg2) : (i64, i64) -> i64
    %2 = "llvm.icmp"(%1, %arg1) <{predicate = 9 : i64}> : (i64, i64) -> i1
    %3 = "llvm.select"(%2, %arg1, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.and"(%0, %3) : (i64, i64) -> i64
    %5 = "llvm.xor"(%3, %4) : (i64, i64) -> i64
    %6 = "llvm.udiv"(%4, %5) : (i64, i64) -> i64
    "func.return"(%6) : (i64) -> ()
  }): () -> ()
}) : () -> ()
