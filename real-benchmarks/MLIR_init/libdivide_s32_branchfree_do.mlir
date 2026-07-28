"builtin.module"() ({
  ^4():
    "llvm.module_flags"() <{"flags" = [#llvm.mlir.module_flag<error, "wchar_size", 4 : i32>, #llvm.mlir.module_flag<min, "PIC Level", 2 : i32>, #llvm.mlir.module_flag<max, "PIE Level", 2 : i32>, #llvm.mlir.module_flag<max, "uwtable", 2 : i32>, #llvm.mlir.module_flag<max, "frame-pointer", 2 : i32>]}> : () -> ()
    "llvm.func"() <{"CConv" = #llvm.cconv<ccc>, always_inline, "arg_attrs" = [{llvm.noundef}, {llvm.noundef}, {llvm.noundef}], dso_local, "frame_pointer" = #llvm.framePointerKind<all>, "function_type" = !llvm.func<void (i32, !llvm.ptr, !llvm.ptr)>, "linkage" = #llvm.linkage<external>, no_unwind, "passthrough" = [["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], "sym_name" = "libdivide_s32_branchfree_do", "target_cpu" = "x86-64", "target_features" = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, "tune_cpu" = "generic", "unnamed_addr" = 0 : i64, "uwtable_kind" = #llvm.uwtableKind<async>, "visibility_" = 0 : i64}> ({
      ^7(%arg7_0 : i32, %arg7_1 : !llvm.ptr, %arg7_2 : !llvm.ptr):
        %8 = "llvm.mlir.constant"() <{"value" = 0 : i32}> : () -> i32
        %9 = "llvm.mlir.constant"() <{"value" = 1 : i32}> : () -> i32
        %10 = "llvm.mlir.constant"() <{"value" = 31 : i32}> : () -> i32
        %11 = "llvm.mlir.constant"() <{"value" = 7 : i32}> : () -> i32
        %12 = "llvm.mlir.constant"() <{"value" = 32 : i64}> : () -> i64
        %13 = "llvm.getelementptr"(%arg7_1, %8) <{"elem_type" = !llvm.struct<"struct.libdivide_s32_branchfree_t", (i32, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 1>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %14 = "llvm.load"(%13) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i8
        %15 = "llvm.zext"(%14) : (i8) -> i32
        %16 = "llvm.and"(%15, %10) : (i32, i32) -> i32
        %17 = "llvm.trunc"(%16) : (i32) -> i8
        %18 = "llvm.sext"(%14) : (i8) -> i32
        %19 = "llvm.ashr"(%18, %11) : (i32, i32) -> i32
        %20 = "llvm.getelementptr"(%arg7_1, %8) <{"elem_type" = !llvm.struct<"struct.libdivide_s32_branchfree_t", (i32, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %21 = "llvm.load"(%20) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i32
        %22 = "llvm.sext"(%arg7_0) : (i32) -> i64
        %23 = "llvm.sext"(%21) : (i32) -> i64
        %24 = "llvm.mul"(%22, %23) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %25 = "llvm.ashr"(%24, %12) : (i64, i64) -> i64
        %26 = "llvm.trunc"(%25) : (i64) -> i32
        %27 = "llvm.add"(%26, %arg7_0) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %28 = "llvm.icmp"(%21, %8) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        %29 = "llvm.zext"(%28) : (i1) -> i32
        %30 = "llvm.ashr"(%27, %10) : (i32, i32) -> i32
        %31 = "llvm.zext"(%17) : (i8) -> i32
        %32 = "llvm.shl"(%9, %31) : (i32, i32) -> i32
        %33 = "llvm.sub"(%32, %29) : (i32, i32) -> i32
        %34 = "llvm.and"(%30, %33) : (i32, i32) -> i32
        %35 = "llvm.add"(%27, %34) : (i32, i32) -> i32
        %36 = "llvm.zext"(%17) : (i8) -> i32
        %37 = "llvm.ashr"(%35, %36) : (i32, i32) -> i32
        %38 = "llvm.xor"(%37, %19) : (i32, i32) -> i32
        %39 = "llvm.sub"(%38, %19) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.store"(%39, %arg7_2) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i32, !llvm.ptr) -> ()
        "llvm.return"() : () -> ()
    }) : () -> ()
}) {"dlti.dl_spec" = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, "llvm.ident" = "Ubuntu clang version 18.1.3 (1ubuntu1)", "llvm.module_asm" = [], "llvm.target_triple" = "x86_64-pc-linux-gnu"} : () -> ()
