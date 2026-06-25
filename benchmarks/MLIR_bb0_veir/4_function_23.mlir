"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i64):
    %0 = "llvm.sext"(%arg0) : (i32) -> i64
    %1 = "llvm.zext"(%arg1) : (i32) -> i64
    %2 = "llvm.or"(%1, %arg2) <{isDisjoint}> : (i64, i64) -> i64
    %3 = "llvm.urem"(%0, %2) : (i64, i64) -> i64
    "func.return"(%3) : (i64) -> ()
  }): () -> ()
}) : () -> ()
