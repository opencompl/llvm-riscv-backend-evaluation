"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i32, %arg1: i64, %arg2: i64, %arg3: i1):
    %0 = "llvm.sext"(%arg0) : (i32) -> i64
    %1 = "llvm.and"(%arg1, %0) : (i64, i64) -> i64
    %2 = "llvm.urem"(%0, %1) : (i64, i64) -> i64
    %3 = "llvm.select"(%arg3, %1, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %4 = "llvm.and"(%arg1, %3) : (i64, i64) -> i64
    %5 = "llvm.and"(%2, %4) : (i64, i64) -> i64
    %6 = "llvm.urem"(%arg2, %5) : (i64, i64) -> i64
    %7 = "llvm.or"(%2, %6) : (i64, i64) -> i64
    "func.return"(%7) : (i64) -> ()
  }): () -> ()
}) : () -> ()
