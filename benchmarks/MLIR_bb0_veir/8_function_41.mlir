"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.icmp"(%arg0, %arg1) <{predicate = 5 : i64}> : (i64, i64) -> i1
    %1 = "llvm.select"(%0, %arg2, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.ashr"(%arg2, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.and"(%arg0, %2) : (i64, i64) -> i64
    %4 = "llvm.xor"(%1, %3) : (i64, i64) -> i64
    %5 = "llvm.urem"(%1, %4) : (i64, i64) -> i64
    %6 = "llvm.select"(%0, %3, %5) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%7) : (i32) -> ()
  }): () -> ()
}) : () -> ()
