"builtin.module"() ({
  ^4():
    "llvm.module_flags"() <{"flags" = [#llvm.mlir.module_flag<error, "wchar_size", 4 : i32>, #llvm.mlir.module_flag<min, "PIC Level", 2 : i32>, #llvm.mlir.module_flag<max, "PIE Level", 2 : i32>, #llvm.mlir.module_flag<max, "uwtable", 2 : i32>, #llvm.mlir.module_flag<max, "frame-pointer", 2 : i32>]}> : () -> ()
    "llvm.func"() <{"CConv" = #llvm.cconv<ccc>, always_inline, "arg_attrs" = [{llvm.noundef}, {llvm.noundef}, {llvm.noundef, llvm.zeroext}, {llvm.noundef}], dso_local, "frame_pointer" = #llvm.framePointerKind<all>, "function_type" = !llvm.func<void (i32, i32, i8, !llvm.ptr)>, "linkage" = #llvm.linkage<external>, no_unwind, "passthrough" = [["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], "sym_name" = "libdivide_u32_do_raw", "target_cpu" = "x86-64", "target_features" = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, "tune_cpu" = "generic", "unnamed_addr" = 0 : i64, "uwtable_kind" = #llvm.uwtableKind<async>, "visibility_" = 0 : i64}> ({
      ^7(%arg7_0 : i32, %arg7_1 : i32, %arg7_2 : i8, %arg7_3 : !llvm.ptr):
        %8 = "llvm.mlir.constant"() <{"value" = 0 : i32}> : () -> i32
        %9 = "llvm.mlir.constant"() <{"value" = 32 : i64}> : () -> i64
        %10 = "llvm.mlir.constant"() <{"value" = 64 : i32}> : () -> i32
        %11 = "llvm.mlir.constant"() <{"value" = 1 : i32}> : () -> i32
        %12 = "llvm.mlir.constant"() <{"value" = 31 : i32}> : () -> i32
        %13 = "llvm.icmp"(%arg7_1, %8) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%13) [^14, ^15] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^15():
        %17 = "llvm.zext"(%arg7_2) : (i8) -> i32
        %18 = "llvm.lshr"(%arg7_0, %17) : (i32, i32) -> i32
        "llvm.store"(%18, %arg7_3) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i32, !llvm.ptr) -> ()
        "llvm.br"() [^20] : () -> ()
      ^14():
        %22 = "llvm.zext"(%arg7_0) : (i32) -> i64
        %23 = "llvm.zext"(%arg7_1) : (i32) -> i64
        %24 = "llvm.mul"(%22, %23) : (i64, i64) -> i64
        %25 = "llvm.lshr"(%24, %9) : (i64, i64) -> i64
        %26 = "llvm.trunc"(%25) : (i64) -> i32
        %27 = "llvm.zext"(%arg7_2) : (i8) -> i32
        %28 = "llvm.and"(%27, %10) : (i32, i32) -> i32
        %29 = "llvm.icmp"(%28, %8) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%29) [^30, ^31] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^30():
        %33 = "llvm.sub"(%arg7_0, %26) : (i32, i32) -> i32
        %34 = "llvm.lshr"(%33, %11) : (i32, i32) -> i32
        %35 = "llvm.add"(%34, %26) : (i32, i32) -> i32
        %36 = "llvm.zext"(%arg7_2) : (i8) -> i32
        %37 = "llvm.and"(%36, %12) : (i32, i32) -> i32
        %38 = "llvm.lshr"(%35, %37) : (i32, i32) -> i32
        "llvm.store"(%38, %arg7_3) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i32, !llvm.ptr) -> ()
        "llvm.br"() [^40] : () -> ()
      ^31():
        %42 = "llvm.zext"(%arg7_2) : (i8) -> i32
        %43 = "llvm.lshr"(%26, %42) : (i32, i32) -> i32
        "llvm.store"(%43, %arg7_3) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 4 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i32, !llvm.ptr) -> ()
        "llvm.br"() [^40] : () -> ()
      ^40():
        "llvm.br"() [^20] : () -> ()
      ^20():
        "llvm.return"() : () -> ()
    }) : () -> ()
}) {"dlti.dl_spec" = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, "llvm.ident" = "clang version 22.1.8 (https://github.com/llvm/llvm-project.git ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", "llvm.module_asm" = [], "llvm.target_triple" = "x86_64-unknown-linux-gnu"} : () -> ()
