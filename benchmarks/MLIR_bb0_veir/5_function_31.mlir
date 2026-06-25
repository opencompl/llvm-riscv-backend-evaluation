"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i32):
    %0 = "llvm.lshr"(%arg1, %arg2) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.icmp"(%arg0, %0) <{predicate = 5 : i64}> : (i64, i64) -> i1
    %2 = "llvm.zext"(%arg3) : (i32) -> i64
    %3 = "llvm.select"(%1, %arg0, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.xor"(%3, %arg1) : (i64, i64) -> i64
    "func.return"(%4) : (i64) -> ()
  }): () -> ()
}) : () -> ()
