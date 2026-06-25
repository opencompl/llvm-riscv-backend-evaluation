"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32):
    %0 = "llvm.lshr"(%arg1, %arg0) : (i64, i64) -> i64
    %1 = "llvm.sdiv"(%arg0, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.lshr"(%1, %arg2) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.sext"(%arg3) : (i32) -> i64
    %4 = "llvm.icmp"(%2, %3) <{predicate = 7 : i64}> : (i64, i64) -> i1
    %5 = "llvm.select"(%4, %2, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    "func.return"(%5) : (i64) -> ()
  }): () -> ()
}) : () -> ()
