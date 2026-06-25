"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1):
    %0 = "llvm.udiv"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.lshr"(%arg2, %arg1) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.ashr"(%0, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.select"(%arg3, %arg2, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.ashr"(%3, %2) : (i64, i64) -> i64
    %5 = "llvm.or"(%2, %4) : (i64, i64) -> i64
    %6 = "llvm.urem"(%arg2, %5) : (i64, i64) -> i64
    %7 = "llvm.icmp"(%5, %6) <{predicate = 6 : i64}> : (i64, i64) -> i1
    "func.return"(%7) : (i1) -> ()
  }): () -> ()
}) : () -> ()
