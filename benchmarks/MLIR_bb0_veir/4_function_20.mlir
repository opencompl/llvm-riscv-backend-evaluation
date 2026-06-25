"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i1, %arg2: i64, %arg3: i32):
    %0 = "llvm.xor"(%arg2, %arg2) : (i64, i64) -> i64
    %1 = "llvm.zext"(%arg3) : (i32) -> i64
    %2 = "llvm.select"(%arg1, %0, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.ashr"(%arg0, %2) <{isExact}> : (i64, i64) -> i64
    "func.return"(%3) : (i64) -> ()
  }): () -> ()
}) : () -> ()
