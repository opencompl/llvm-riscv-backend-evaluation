"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32):
    %0 = "llvm.sdiv"(%arg0, %arg1) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.icmp"(%0, %arg1) <{predicate = 4 : i64}> : (i64, i64) -> i1
    %2 = "llvm.ashr"(%arg2, %0) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.sext"(%arg3) : (i32) -> i64
    %4 = "llvm.srem"(%2, %3) : (i64, i64) -> i64
    %5 = "llvm.select"(%1, %0, %4) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %6 = "llvm.srem"(%arg2, %3) : (i64, i64) -> i64
    %7 = "llvm.ashr"(%5, %6) <{isExact}> : (i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
