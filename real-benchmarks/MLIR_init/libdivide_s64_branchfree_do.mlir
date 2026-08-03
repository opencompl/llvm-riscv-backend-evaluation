"builtin.module"() ({
  ^4():
    "llvm.module_flags"() <{"flags" = [#llvm.mlir.module_flag<error, "wchar_size", 4 : i32>, #llvm.mlir.module_flag<min, "PIC Level", 2 : i32>, #llvm.mlir.module_flag<max, "PIE Level", 2 : i32>, #llvm.mlir.module_flag<max, "uwtable", 2 : i32>, #llvm.mlir.module_flag<max, "frame-pointer", 2 : i32>]}> : () -> ()
    "llvm.func"() <{"CConv" = #llvm.cconv<ccc>, always_inline, "arg_attrs" = [{llvm.noundef}, {llvm.noundef}, {llvm.noundef}], dso_local, "frame_pointer" = #llvm.framePointerKind<all>, "function_type" = !llvm.func<void (i64, !llvm.ptr, !llvm.ptr)>, "linkage" = #llvm.linkage<external>, no_unwind, "passthrough" = [["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], "sym_name" = "libdivide_s64_branchfree_do", "target_cpu" = "x86-64", "target_features" = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, "tune_cpu" = "generic", "unnamed_addr" = 0 : i64, "uwtable_kind" = #llvm.uwtableKind<async>, "visibility_" = 0 : i64}> ({
      ^7(%arg7_0 : i64, %arg7_1 : !llvm.ptr, %arg7_2 : !llvm.ptr):
        %8 = "llvm.mlir.constant"() <{"value" = 0 : i32}> : () -> i32
        %10 = "llvm.mlir.constant"() <{"value" = 63 : i32}> : () -> i32
        %11 = "llvm.mlir.constant"() <{"value" = 7 : i32}> : () -> i32
        %12 = "llvm.mlir.constant"() <{"value" = -1 : i32}> : () -> i32
        %13 = "llvm.mlir.constant"() <{"value" = 32 : i64}> : () -> i64
        %14 = "llvm.mlir.constant"() <{"value" = 0 : i64}> : () -> i64
        %15 = "llvm.mlir.constant"() <{"value" = 63 : i64}> : () -> i64
        %16 = "llvm.mlir.constant"() <{"value" = 1 : i64}> : () -> i64
        %17 = "llvm.getelementptr"(%arg7_1, %8) <{"elem_type" = !llvm.struct<"struct.libdivide_s64_branchfree_t", (i64, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 1>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %18 = "llvm.load"(%17) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i8
        %19 = "llvm.zext"(%18) : (i8) -> i32
        %20 = "llvm.and"(%19, %10) : (i32, i32) -> i32
        %21 = "llvm.trunc"(%20) : (i32) -> i8
        %22 = "llvm.sext"(%18) : (i8) -> i32
        %23 = "llvm.ashr"(%22, %11) : (i32, i32) -> i32
        %24 = "llvm.sext"(%23) : (i32) -> i64
        %25 = "llvm.getelementptr"(%arg7_1, %8) <{"elem_type" = !llvm.struct<"struct.libdivide_s64_branchfree_t", (i64, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %26 = "llvm.load"(%25) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i64
        %27 = "llvm.zext"(%12) : (i32) -> i64
        %28 = "llvm.and"(%arg7_0, %27) : (i64, i64) -> i64
        %29 = "llvm.trunc"(%28) : (i64) -> i32
        %31 = "llvm.and"(%26, %27) : (i64, i64) -> i64
        %32 = "llvm.trunc"(%31) : (i64) -> i32
        %33 = "llvm.ashr"(%arg7_0, %13) : (i64, i64) -> i64
        %34 = "llvm.trunc"(%33) : (i64) -> i32
        %35 = "llvm.ashr"(%26, %13) : (i64, i64) -> i64
        %36 = "llvm.trunc"(%35) : (i64) -> i32
        %37 = "llvm.zext"(%29) : (i32) -> i64
        %38 = "llvm.zext"(%32) : (i32) -> i64
        %39 = "llvm.mul"(%37, %38) : (i64, i64) -> i64
        %40 = "llvm.lshr"(%39, %13) : (i64, i64) -> i64
        %41 = "llvm.trunc"(%40) : (i64) -> i32
        %42 = "llvm.sext"(%34) : (i32) -> i64
        %44 = "llvm.mul"(%42, %38) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %45 = "llvm.zext"(%41) : (i32) -> i64
        %46 = "llvm.add"(%44, %45) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %48 = "llvm.sext"(%36) : (i32) -> i64
        %49 = "llvm.mul"(%37, %48) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %51 = "llvm.and"(%46, %27) : (i64, i64) -> i64
        %52 = "llvm.add"(%49, %51) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %55 = "llvm.mul"(%42, %48) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %56 = "llvm.ashr"(%46, %13) : (i64, i64) -> i64
        %57 = "llvm.add"(%55, %56) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %58 = "llvm.ashr"(%52, %13) : (i64, i64) -> i64
        %59 = "llvm.add"(%57, %58) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %60 = "llvm.add"(%59, %arg7_0) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %61 = "llvm.icmp"(%26, %14) <{"predicate" = 0 : i64}> : (i64, i64) -> i1
        %62 = "llvm.zext"(%61) : (i1) -> i32
        %63 = "llvm.sext"(%62) : (i32) -> i64
        %64 = "llvm.ashr"(%60, %15) : (i64, i64) -> i64
        %65 = "llvm.zext"(%21) : (i8) -> i32
        %66 = "llvm.zext"(%65) : (i32) -> i64
        %67 = "llvm.shl"(%16, %66) : (i64, i64) -> i64
        %68 = "llvm.sub"(%67, %63) : (i64, i64) -> i64
        %69 = "llvm.and"(%64, %68) : (i64, i64) -> i64
        %70 = "llvm.add"(%60, %69) : (i64, i64) -> i64
        %73 = "llvm.ashr"(%70, %66) : (i64, i64) -> i64
        %74 = "llvm.xor"(%73, %24) : (i64, i64) -> i64
        %75 = "llvm.sub"(%74, %24) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        "llvm.store"(%75, %arg7_2) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i64, !llvm.ptr) -> ()
        "llvm.return"() : () -> ()
    }) : () -> ()
}) {"dlti.dl_spec" = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, "llvm.ident" = "Ubuntu clang version 18.1.3 (1ubuntu1)", "llvm.module_asm" = [], "llvm.target_triple" = "x86_64-pc-linux-gnu"} : () -> ()
