"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> ()}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i64, %arg2: i64, %arg3: !llvm.ptr, %arg4: i64, %arg5: i64):
    %0 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 2 : i64}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.icmp"(%arg4, %0) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%3)[^bb1, ^bb2] <{branch_weights = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb1:  // pred: ^bb0
    "llvm.br"(%arg1)[^bb3] : (i64) -> ()
    ^bb2:  // pred: ^bb0
    "llvm.br"(%1)[^bb3] : (i64) -> ()
    ^bb3(%4: i64):  // 2 preds: ^bb1, ^bb2
    %5 = "llvm.icmp"(%arg4, %0) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%5)[^bb4, ^bb5] <{branch_weights = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb4:  // pred: ^bb3
    "llvm.br"(%2)[^bb6] : (i64) -> ()
    ^bb5:  // pred: ^bb3
    %6 = "llvm.sdiv"(%arg5, %1) : (i64, i64) -> i64
    "llvm.br"(%6)[^bb6] : (i64) -> ()
    ^bb6(%7: i64):  // 2 preds: ^bb4, ^bb5
    %8 = "llvm.sdiv"(%arg1, %1) : (i64, i64) -> i64
    "llvm.br"(%7, %8, %0, %4)[^bb7] : (i64, i64, i64, i64) -> ()
    ^bb7(%9: i64, %10: i64, %11: i64, %12: i64):  // 2 preds: ^bb6, ^bb26
    "llvm.br"(%0, %arg1)[^bb8] : (i64, i64) -> ()
    ^bb8(%13: i64, %14: i64):  // 2 preds: ^bb7, ^bb9
    %15 = "llvm.icmp"(%14, %2) <{predicate = 4 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%15)[^bb9, ^bb10] <{branch_weights = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb9:  // pred: ^bb8
    %16 = "llvm.ashr"(%14, %2) : (i64, i64) -> i64
    %17 = "llvm.add"(%13, %2) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    "llvm.br"(%17, %16)[^bb8] : (i64, i64) -> ()
    ^bb10:  // pred: ^bb8
    %18 = "llvm.icmp"(%11, %13) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%18)[^bb11, ^bb27] <{branch_weights = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb11:  // pred: ^bb10
    "llvm.br"(%0)[^bb12] : (i64) -> ()
    ^bb12(%19: i64):  // 2 preds: ^bb11, ^bb18
    %20 = "llvm.sdiv"(%arg1, %12) : (i64, i64) -> i64
    %21 = "llvm.icmp"(%19, %20) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%21)[^bb13, ^bb19] <{branch_weights = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb13:  // pred: ^bb12
    "llvm.br"(%0)[^bb14] : (i64) -> ()
    ^bb14(%22: i64):  // 2 preds: ^bb13, ^bb16
    %23 = "llvm.sdiv"(%12, %1) : (i64, i64) -> i64
    %24 = "llvm.icmp"(%22, %23) <{predicate = 2 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%24)[^bb15, ^bb17] <{branch_weights = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb15:  // pred: ^bb14
    %25 = "llvm.mul"(%19, %12) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %26 = "llvm.add"(%25, %22) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %27 = "llvm.getelementptr"(%arg0, %26) <{elem_type = i64, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %28 = "llvm.load"(%27) <{access_groups = [], alias_scopes = [], alignment = 8 : i64, noalias_scopes = [], ordering = 0 : i64, tbaa = []}> : (!llvm.ptr) -> i64
    %29 = "llvm.sdiv"(%12, %1) : (i64, i64) -> i64
    %30 = "llvm.add"(%26, %29) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %31 = "llvm.getelementptr"(%arg0, %30) <{elem_type = i64, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %32 = "llvm.load"(%31) <{access_groups = [], alias_scopes = [], alignment = 8 : i64, noalias_scopes = [], ordering = 0 : i64, tbaa = []}> : (!llvm.ptr) -> i64
    %33 = "llvm.mul"(%1, %22) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %34 = "llvm.add"(%33, %2) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %35 = "llvm.mul"(%34, %10) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %36 = "llvm.getelementptr"(%arg3, %35) <{elem_type = i64, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %37 = "llvm.load"(%36) <{access_groups = [], alias_scopes = [], alignment = 8 : i64, noalias_scopes = [], ordering = 0 : i64, tbaa = []}> : (!llvm.ptr) -> i64
    %38 = "llvm.mul"(%37, %32) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %39 = "llvm.srem"(%38, %arg2) : (i64, i64) -> i64
    %40 = "llvm.add"(%28, %39) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %41 = "llvm.srem"(%40, %arg2) : (i64, i64) -> i64
    %42 = "llvm.sub"(%28, %39) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %43 = "llvm.add"(%42, %arg2) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %44 = "llvm.srem"(%43, %arg2) : (i64, i64) -> i64
    %45 = "llvm.getelementptr"(%arg0, %26) <{elem_type = i64, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    "llvm.store"(%41, %45) <{access_groups = [], alias_scopes = [], alignment = 8 : i64, noalias_scopes = [], ordering = 0 : i64, tbaa = []}> : (i64, !llvm.ptr) -> ()
    %46 = "llvm.getelementptr"(%arg0, %30) <{elem_type = i64, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    "llvm.store"(%44, %46) <{access_groups = [], alias_scopes = [], alignment = 8 : i64, noalias_scopes = [], ordering = 0 : i64, tbaa = []}> : (i64, !llvm.ptr) -> ()
    "llvm.br"()[^bb16] : () -> ()
    ^bb16:  // pred: ^bb15
    %47 = "llvm.add"(%22, %2) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    "llvm.br"(%47)[^bb14] : (i64) -> ()
    ^bb17:  // pred: ^bb14
    "llvm.br"()[^bb18] : () -> ()
    ^bb18:  // pred: ^bb17
    %48 = "llvm.add"(%19, %2) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    "llvm.br"(%48)[^bb12] : (i64) -> ()
    ^bb19:  // pred: ^bb12
    %49 = "llvm.sdiv"(%10, %1) : (i64, i64) -> i64
    %50 = "llvm.icmp"(%arg4, %0) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%50)[^bb20, ^bb21] <{branch_weights = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb20:  // pred: ^bb19
    %51 = "llvm.sdiv"(%12, %1) : (i64, i64) -> i64
    "llvm.br"(%51)[^bb22] : (i64) -> ()
    ^bb21:  // pred: ^bb19
    %52 = "llvm.add"(%12, %12) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    "llvm.br"(%52)[^bb22] : (i64) -> ()
    ^bb22(%53: i64):  // 2 preds: ^bb20, ^bb21
    %54 = "llvm.icmp"(%arg4, %0) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%54)[^bb23, ^bb24] <{branch_weights = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb23:  // pred: ^bb22
    %55 = "llvm.add"(%9, %9) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    "llvm.br"(%55)[^bb25] : (i64) -> ()
    ^bb24:  // pred: ^bb22
    %56 = "llvm.sdiv"(%9, %1) : (i64, i64) -> i64
    "llvm.br"(%56)[^bb25] : (i64) -> ()
    ^bb25(%57: i64):  // 2 preds: ^bb23, ^bb24
    "llvm.br"()[^bb26] : () -> ()
    ^bb26:  // pred: ^bb25
    %58 = "llvm.add"(%11, %2) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    "llvm.br"(%57, %49, %58, %53)[^bb7] : (i64, i64, i64, i64) -> ()
    ^bb27:  // pred: ^bb10
    "func.return"() : () -> ()
  }): () -> ()
}) : () -> ()
