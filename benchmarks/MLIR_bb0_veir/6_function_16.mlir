"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i32):
    %0 = "llvm.select"(%arg0, %arg1, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %1 = "llvm.sext"(%arg2) : (i32) -> i64
    %2 = "llvm.lshr"(%0, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.urem"(%0, %0) : (i64, i64) -> i64
    %4 = "llvm.sdiv"(%3, %arg1) : (i64, i64) -> i64
    %5 = "llvm.icmp"(%2, %4) <{predicate = 0 : i64}> : (i64, i64) -> i1
    "func.return"(%5) : (i1) -> ()
  }): () -> ()
}) : () -> ()
