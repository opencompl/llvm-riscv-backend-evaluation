"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.icmp"(%arg0, %arg0) <{predicate = 8 : i64}> : (i64, i64) -> i1
    %1 = "llvm.or"(%arg1, %arg2) <{isDisjoint}> : (i64, i64) -> i64
    %2 = "llvm.lshr"(%1, %arg0) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.sdiv"(%1, %2) <{isExact}> : (i64, i64) -> i64
    %4 = "llvm.select"(%0, %3, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.xor"(%4, %arg0) : (i64, i64) -> i64
    %6 = "llvm.urem"(%5, %3) : (i64, i64) -> i64
    %7 = "llvm.trunc"(%6) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%7) : (i1) -> ()
  }): () -> ()
}) : () -> ()
