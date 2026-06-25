"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.urem"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.icmp"(%0, %arg1) <{predicate = 5 : i64}> : (i64, i64) -> i1
    %2 = "llvm.urem"(%arg2, %arg1) : (i64, i64) -> i64
    %3 = "llvm.srem"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.select"(%1, %arg0, %3) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.sdiv"(%0, %4) <{isExact}> : (i64, i64) -> i64
    %6 = "llvm.lshr"(%arg0, %5) <{isExact}> : (i64, i64) -> i64
    "func.return"(%6) : (i64) -> ()
  }): () -> ()
}) : () -> ()
