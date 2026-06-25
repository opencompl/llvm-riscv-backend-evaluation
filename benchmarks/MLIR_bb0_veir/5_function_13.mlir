"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i32):
    %0 = "llvm.sdiv"(%arg0, %arg1) <{isExact}> : (i64, i64) -> i64
    %1 = "llvm.zext"(%arg2) : (i32) -> i64
    %2 = "llvm.lshr"(%1, %0) : (i64, i64) -> i64
    %3 = "llvm.sdiv"(%2, %1) : (i64, i64) -> i64
    %4 = "llvm.icmp"(%0, %3) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "func.return"(%4) : (i1) -> ()
  }): () -> ()
}) : () -> ()
