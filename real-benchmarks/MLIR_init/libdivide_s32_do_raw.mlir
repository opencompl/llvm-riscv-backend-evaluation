"builtin.module"() ({
  ^4():
    "llvm.module_flags"() <{"flags" = [#llvm.mlir.module_flag<error, "wchar_size", 4 : i32>, #llvm.mlir.module_flag<min, "PIC Level", 2 : i32>, #llvm.mlir.module_flag<max, "PIE Level", 2 : i32>, #llvm.mlir.module_flag<max, "uwtable", 2 : i32>, #llvm.mlir.module_flag<max, "frame-pointer", 2 : i32>]}> : () -> ()
    "llvm.func"() <{"CConv" = #llvm.cconv<ccc>, always_inline, "arg_attrs" = [{llvm.noundef}, {llvm.noundef}, {llvm.noundef, llvm.zeroext}, {llvm.noundef}], dso_local, "frame_pointer" = #llvm.framePointerKind<all>, "function_type" = !llvm.func<void (i32, i32, i8, !llvm.ptr)>, "linkage" = #llvm.linkage<external>, no_unwind, "passthrough" = [["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], "sym_name" = "libdivide_s32_do_raw", "target_cpu" = "x86-64", "target_features" = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, "tune_cpu" = "generic", "unnamed_addr" = 0 : i64, "uwtable_kind" = #llvm.uwtableKind<async>, "visibility_" = 0 : i64}> ({
      ^7(%arg7_0 : i32, %arg7_1 : i32, %arg7_2 : i8, %arg7_3 : !llvm.ptr):
        %8 = "llvm.mlir.constant"() <{"value" = 31 : i32}> : () -> i32
        %9 = "llvm.mlir.constant"() <{"value" = 0 : i32}> : () -> i32
        %10 = "llvm.mlir.constant"() <{"value" = 7 : i32}> : () -> i32
        %11 = "llvm.mlir.constant"() <{"value" = 1 : i32}> : () -> i32
        %12 = "llvm.mlir.constant"() <{"value" = 32 : i64}> : () -> i64
        %13 = "llvm.mlir.constant"() <{"value" = 64 : i32}> : () -> i32
        %14 = "llvm.zext"(%arg7_2) : (i8) -> i32
        %15 = "llvm.and"(%14, %8) : (i32, i32) -> i32
        %16 = "llvm.trunc"(%15) : (i32) -> i8
        %17 = "llvm.icmp"(%arg7_1, %9) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%17) [^18, ^19] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^19():
        %21 = "llvm.sext"(%arg7_2) : (i8) -> i32
        %22 = "llvm.ashr"(%21, %10) : (i32, i32) -> i32
        %23 = "llvm.zext"(%16) : (i8) -> i32
        %24 = "llvm.shl"(%11, %23) : (i32, i32) -> i32
        %25 = "llvm.sub"(%24, %11) : (i32, i32) -> i32
        %26 = "llvm.ashr"(%arg7_0, %8) : (i32, i32) -> i32
        %27 = "llvm.and"(%26, %25) : (i32, i32) -> i32
        %28 = "llvm.add"(%arg7_0, %27) : (i32, i32) -> i32
        %30 = "llvm.ashr"(%28, %23) : (i32, i32) -> i32
        %31 = "llvm.xor"(%30, %22) : (i32, i32) -> i32
        %32 = "llvm.sub"(%31, %22) : (i32, i32) -> i32
        "llvm.store"(%32, %arg7_3) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i32, !llvm.ptr) -> ()
        "llvm.br"() [^34] : () -> ()
      ^18():
        %36 = "llvm.sext"(%arg7_0) : (i32) -> i64
        %37 = "llvm.sext"(%arg7_1) : (i32) -> i64
        %38 = "llvm.mul"(%36, %37) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %39 = "llvm.ashr"(%38, %12) : (i64, i64) -> i64
        %40 = "llvm.trunc"(%39) : (i64) -> i32
        %41 = "llvm.zext"(%arg7_2) : (i8) -> i32
        %42 = "llvm.and"(%41, %13) : (i32, i32) -> i32
        %43 = "llvm.icmp"(%42, %9) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%43, %40) [^44, ^45] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 1>}> : (i1, i32) -> ()
      ^44():
        %47 = "llvm.sext"(%arg7_2) : (i8) -> i32
        %48 = "llvm.ashr"(%47, %10) : (i32, i32) -> i32
        %49 = "llvm.xor"(%arg7_0, %48) : (i32, i32) -> i32
        %50 = "llvm.sub"(%49, %48) : (i32, i32) -> i32
        %51 = "llvm.add"(%40, %50) : (i32, i32) -> i32
        "llvm.br"(%51) [^45] : (i32) -> ()
      ^45(%arg45_0 : i32):
        %53 = "llvm.zext"(%16) : (i8) -> i32
        %54 = "llvm.ashr"(%arg45_0, %53) : (i32, i32) -> i32
        %55 = "llvm.icmp"(%54, %9) <{"predicate" = 2 : i64}> : (i32, i32) -> i1
        %56 = "llvm.zext"(%55) : (i1) -> i32
        %57 = "llvm.add"(%54, %56) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.store"(%57, %arg7_3) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i32, !llvm.ptr) -> ()
        "llvm.br"() [^34] : () -> ()
      ^34():
        "llvm.return"() : () -> ()
    }) : () -> ()
}) {"dlti.dl_spec" = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, "llvm.ident" = "Ubuntu clang version 18.1.3 (1ubuntu1)", "llvm.module_asm" = [], "llvm.target_triple" = "x86_64-pc-linux-gnu"} : () -> ()
