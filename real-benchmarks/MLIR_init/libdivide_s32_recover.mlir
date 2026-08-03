"builtin.module"() ({
  ^4():
    "llvm.module_flags"() <{"flags" = [#llvm.mlir.module_flag<error, "wchar_size", 4 : i32>, #llvm.mlir.module_flag<min, "PIC Level", 2 : i32>, #llvm.mlir.module_flag<max, "PIE Level", 2 : i32>, #llvm.mlir.module_flag<max, "uwtable", 2 : i32>, #llvm.mlir.module_flag<max, "frame-pointer", 2 : i32>]}> : () -> ()
    "llvm.func"() <{"CConv" = #llvm.cconv<ccc>, always_inline, "arg_attrs" = [{llvm.noundef}, {llvm.noundef}], dso_local, "frame_pointer" = #llvm.framePointerKind<all>, "function_type" = !llvm.func<void (!llvm.ptr, !llvm.ptr)>, "linkage" = #llvm.linkage<external>, no_unwind, "passthrough" = [["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], "sym_name" = "libdivide_s32_recover", "target_cpu" = "x86-64", "target_features" = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, "tune_cpu" = "generic", "unnamed_addr" = 0 : i64, "uwtable_kind" = #llvm.uwtableKind<async>, "visibility_" = 0 : i64}> ({
      ^7(%arg7_0 : !llvm.ptr, %arg7_1 : !llvm.ptr):
        %8 = "llvm.mlir.constant"() <{"value" = 0 : i32}> : () -> i32
        %9 = "llvm.mlir.constant"() <{"value" = 1 : i32}> : () -> i32
        %10 = "llvm.mlir.constant"() <{"value" = 31 : i32}> : () -> i32
        %11 = "llvm.mlir.constant"() <{"value" = 128 : i32}> : () -> i32
        %12 = "llvm.mlir.constant"() <{"value" = 64 : i32}> : () -> i32
        %13 = "llvm.mlir.constant"() <{"value" = 32 : i32}> : () -> i32
        %14 = "llvm.mlir.constant"() <{"value" = 1 : i64}> : () -> i64
        %15 = "llvm.getelementptr"(%arg7_0, %8) <{"elem_type" = !llvm.struct<"struct.libdivide_s32_t", (i32, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 1>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %16 = "llvm.load"(%15) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i8
        %17 = "llvm.zext"(%16) : (i8) -> i32
        %18 = "llvm.and"(%17, %10) : (i32, i32) -> i32
        %19 = "llvm.trunc"(%18) : (i32) -> i8
        %20 = "llvm.getelementptr"(%arg7_0, %8) <{"elem_type" = !llvm.struct<"struct.libdivide_s32_t", (i32, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %21 = "llvm.load"(%20) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i32
        %22 = "llvm.icmp"(%21, %8) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%22) [^23, ^24] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^24():
        %26 = "llvm.zext"(%19) : (i8) -> i32
        %27 = "llvm.shl"(%9, %26) : (i32, i32) -> i32
        %28 = "llvm.zext"(%16) : (i8) -> i32
        %29 = "llvm.and"(%28, %11) : (i32, i32) -> i32
        %30 = "llvm.icmp"(%29, %8) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%30, %27) [^31, ^32] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 1>}> : (i1, i32) -> ()
      ^31():
        %34 = "llvm.sub"(%8, %27) : (i32, i32) -> i32
        "llvm.br"(%34) [^32] : (i32) -> ()
      ^32(%arg32_0 : i32):
        "llvm.store"(%arg32_0, %arg7_1) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i32, !llvm.ptr) -> ()
        "llvm.br"() [^37] : () -> ()
      ^23():
        %39 = "llvm.zext"(%16) : (i8) -> i32
        %40 = "llvm.and"(%39, %11) : (i32, i32) -> i32
        %42 = "llvm.and"(%39, %12) : (i32, i32) -> i32
        %43 = "llvm.icmp"(%42, %8) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%43) [^44, ^45] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^44():
        %47 = "llvm.getelementptr"(%arg7_0, %8) <{"elem_type" = !llvm.struct<"struct.libdivide_s32_t", (i32, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %48 = "llvm.load"(%47) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i32
        %49 = "llvm.icmp"(%48, %8) <{"predicate" = 4 : i64}> : (i32, i32) -> i1
        %50 = "llvm.zext"(%49) : (i1) -> i32
        "llvm.br"(%50) [^51] : (i32) -> ()
      ^45():
        %53 = "llvm.getelementptr"(%arg7_0, %8) <{"elem_type" = !llvm.struct<"struct.libdivide_s32_t", (i32, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %54 = "llvm.load"(%53) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i32
        %55 = "llvm.icmp"(%54, %8) <{"predicate" = 2 : i64}> : (i32, i32) -> i1
        %56 = "llvm.zext"(%55) : (i1) -> i32
        "llvm.br"(%56) [^51] : (i32) -> ()
      ^51(%arg51_0 : i32):
        %58 = "llvm.getelementptr"(%arg7_0, %8) <{"elem_type" = !llvm.struct<"struct.libdivide_s32_t", (i32, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %59 = "llvm.load"(%58) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i32
        %60 = "llvm.icmp"(%59, %8) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%60) [^61, ^62] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^61():
        %64 = "llvm.zext"(%19) : (i8) -> i32
        %65 = "llvm.shl"(%9, %64) : (i32, i32) -> i32
        %66 = "llvm.icmp"(%40, %8) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%66) [^67, ^68] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^67():
        %70 = "llvm.sub"(%8, %65) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%70) [^71] : (i32) -> ()
      ^68():
        "llvm.br"(%65) [^71] : (i32) -> ()
      ^71(%arg71_0 : i32):
        "llvm.store"(%arg71_0, %arg7_1) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i32, !llvm.ptr) -> ()
        "llvm.br"() [^62] : () -> ()
      ^62():
        %76 = "llvm.icmp"(%arg51_0, %8) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%76) [^77, ^78] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^77():
        %80 = "llvm.getelementptr"(%arg7_0, %8) <{"elem_type" = !llvm.struct<"struct.libdivide_s32_t", (i32, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %81 = "llvm.load"(%80) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i32
        %82 = "llvm.sub"(%8, %81) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%82) [^83] : (i32) -> ()
      ^78():
        %85 = "llvm.getelementptr"(%arg7_0, %8) <{"elem_type" = !llvm.struct<"struct.libdivide_s32_t", (i32, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %86 = "llvm.load"(%85) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i32
        "llvm.br"(%86) [^83] : (i32) -> ()
      ^83(%arg83_0 : i32):
        %88 = "llvm.zext"(%19) : (i8) -> i32
        %89 = "llvm.add"(%13, %88) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %90 = "llvm.zext"(%89) : (i32) -> i64
        %91 = "llvm.shl"(%14, %90) : (i64, i64) -> i64
        %92 = "llvm.zext"(%arg83_0) : (i32) -> i64
        %93 = "llvm.udiv"(%91, %92) : (i64, i64) -> i64
        %94 = "llvm.trunc"(%93) : (i64) -> i32
        %95 = "llvm.add"(%94, %9) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %96 = "llvm.icmp"(%40, %8) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%96) [^97, ^98] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^97():
        %100 = "llvm.sub"(%8, %95) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%100) [^101] : (i32) -> ()
      ^98():
        "llvm.br"(%95) [^101] : (i32) -> ()
      ^101(%arg101_0 : i32):
        "llvm.store"(%arg101_0, %arg7_1) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i32, !llvm.ptr) -> ()
        "llvm.br"() [^37] : () -> ()
      ^37():
        "llvm.return"() : () -> ()
    }) : () -> ()
}) {"dlti.dl_spec" = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, "llvm.ident" = "Ubuntu clang version 18.1.3 (1ubuntu1)", "llvm.module_asm" = [], "llvm.target_triple" = "x86_64-pc-linux-gnu"} : () -> ()
