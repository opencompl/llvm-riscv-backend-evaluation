"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32):
    %0 = "llvm.icmp"(%arg0, %arg1) <{predicate = 7 : i64}> : (i64, i64) -> i1
    %1 = "llvm.or"(%arg0, %arg1) : (i64, i64) -> i64
    %2 = "llvm.udiv"(%arg1, %arg2) : (i64, i64) -> i64
    %3 = "llvm.xor"(%1, %2) : (i64, i64) -> i64
    %4 = "llvm.xor"(%arg0, %3) : (i64, i64) -> i64
    %5 = "llvm.and"(%3, %4) : (i64, i64) -> i64
    %6 = "llvm.zext"(%arg3) : (i32) -> i64
    %7 = "llvm.select"(%0, %5, %6) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
