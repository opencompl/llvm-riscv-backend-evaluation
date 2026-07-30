"builtin.module"() ({
  ^4():
    "llvm.module_flags"() <{"flags" = [#llvm.mlir.module_flag<error, "wchar_size", 4 : i32>, #llvm.mlir.module_flag<min, "PIC Level", 2 : i32>, #llvm.mlir.module_flag<max, "PIE Level", 2 : i32>, #llvm.mlir.module_flag<max, "uwtable", 2 : i32>, #llvm.mlir.module_flag<max, "frame-pointer", 2 : i32>]}> : () -> ()
    "llvm.func"() <{"CConv" = #llvm.cconv<ccc>, always_inline, "arg_attrs" = [{llvm.noundef}, {llvm.noundef}, {llvm.noundef, llvm.zeroext}, {llvm.noundef}], dso_local, "frame_pointer" = #llvm.framePointerKind<all>, "function_type" = !llvm.func<void (i64, i64, i8, !llvm.ptr)>, "linkage" = #llvm.linkage<external>, no_unwind, "passthrough" = [["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], "sym_name" = "libdivide_s64_do_raw", "target_cpu" = "x86-64", "target_features" = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, "tune_cpu" = "generic", "unnamed_addr" = 0 : i64, "uwtable_kind" = #llvm.uwtableKind<async>, "visibility_" = 0 : i64}> ({
      ^7(%arg7_0 : i64, %arg7_1 : i64, %arg7_2 : i8, %arg7_3 : !llvm.ptr):
        %8 = "llvm.mlir.constant"() <{"value" = 63 : i32}> : () -> i32
        %9 = "llvm.mlir.constant"() <{"value" = 0 : i64}> : () -> i64
        %10 = "llvm.mlir.constant"() <{"value" = 1 : i64}> : () -> i64
        %11 = "llvm.mlir.constant"() <{"value" = 63 : i64}> : () -> i64
        %12 = "llvm.mlir.constant"() <{"value" = 7 : i32}> : () -> i32
        %13 = "llvm.mlir.constant"() <{"value" = -1 : i32}> : () -> i32
        %14 = "llvm.mlir.constant"() <{"value" = 32 : i64}> : () -> i64
        %15 = "llvm.mlir.constant"() <{"value" = 64 : i32}> : () -> i32
        %16 = "llvm.mlir.constant"() <{"value" = 0 : i32}> : () -> i32
        %17 = "llvm.zext"(%arg7_2) : (i8) -> i32
        %18 = "llvm.and"(%17, %8) : (i32, i32) -> i32
        %19 = "llvm.trunc"(%18) : (i32) -> i8
        %20 = "llvm.icmp"(%arg7_1, %9) <{"predicate" = 1 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%20) [^21, ^22] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^22():
        %24 = "llvm.zext"(%19) : (i8) -> i32
        %25 = "llvm.zext"(%24) : (i32) -> i64
        %26 = "llvm.shl"(%10, %25) : (i64, i64) -> i64
        %27 = "llvm.sub"(%26, %10) : (i64, i64) -> i64
        %28 = "llvm.ashr"(%arg7_0, %11) : (i64, i64) -> i64
        %29 = "llvm.and"(%28, %27) : (i64, i64) -> i64
        %30 = "llvm.add"(%arg7_0, %29) : (i64, i64) -> i64
        %33 = "llvm.ashr"(%30, %25) : (i64, i64) -> i64
        %34 = "llvm.sext"(%arg7_2) : (i8) -> i32
        %35 = "llvm.ashr"(%34, %12) : (i32, i32) -> i32
        %36 = "llvm.sext"(%35) : (i32) -> i64
        %37 = "llvm.xor"(%33, %36) : (i64, i64) -> i64
        %38 = "llvm.sub"(%37, %36) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        "llvm.store"(%38, %arg7_3) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i64, !llvm.ptr) -> ()
        "llvm.br"() [^40] : () -> ()
      ^21():
        %42 = "llvm.zext"(%13) : (i32) -> i64
        %43 = "llvm.and"(%arg7_0, %42) : (i64, i64) -> i64
        %44 = "llvm.trunc"(%43) : (i64) -> i32
        %46 = "llvm.and"(%arg7_1, %42) : (i64, i64) -> i64
        %47 = "llvm.trunc"(%46) : (i64) -> i32
        %48 = "llvm.ashr"(%arg7_0, %14) : (i64, i64) -> i64
        %49 = "llvm.trunc"(%48) : (i64) -> i32
        %50 = "llvm.ashr"(%arg7_1, %14) : (i64, i64) -> i64
        %51 = "llvm.trunc"(%50) : (i64) -> i32
        %52 = "llvm.zext"(%44) : (i32) -> i64
        %53 = "llvm.zext"(%47) : (i32) -> i64
        %54 = "llvm.mul"(%52, %53) : (i64, i64) -> i64
        %55 = "llvm.lshr"(%54, %14) : (i64, i64) -> i64
        %56 = "llvm.trunc"(%55) : (i64) -> i32
        %57 = "llvm.sext"(%49) : (i32) -> i64
        %59 = "llvm.mul"(%57, %53) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %60 = "llvm.zext"(%56) : (i32) -> i64
        %61 = "llvm.add"(%59, %60) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %63 = "llvm.sext"(%51) : (i32) -> i64
        %64 = "llvm.mul"(%52, %63) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %66 = "llvm.and"(%61, %42) : (i64, i64) -> i64
        %67 = "llvm.add"(%64, %66) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %70 = "llvm.mul"(%57, %63) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %71 = "llvm.ashr"(%61, %14) : (i64, i64) -> i64
        %72 = "llvm.add"(%70, %71) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %73 = "llvm.ashr"(%67, %14) : (i64, i64) -> i64
        %74 = "llvm.add"(%72, %73) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %75 = "llvm.zext"(%arg7_2) : (i8) -> i32
        %76 = "llvm.and"(%75, %15) : (i32, i32) -> i32
        %77 = "llvm.icmp"(%76, %16) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%77, %74) [^78, ^79] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 1>}> : (i1, i64) -> ()
      ^78():
        %81 = "llvm.sext"(%arg7_2) : (i8) -> i32
        %82 = "llvm.ashr"(%81, %12) : (i32, i32) -> i32
        %83 = "llvm.sext"(%82) : (i32) -> i64
        %84 = "llvm.xor"(%arg7_0, %83) : (i64, i64) -> i64
        %85 = "llvm.sub"(%84, %83) : (i64, i64) -> i64
        %86 = "llvm.add"(%74, %85) : (i64, i64) -> i64
        "llvm.br"(%86) [^79] : (i64) -> ()
      ^79(%arg79_0 : i64):
        %88 = "llvm.zext"(%19) : (i8) -> i32
        %89 = "llvm.zext"(%88) : (i32) -> i64
        %90 = "llvm.ashr"(%arg79_0, %89) : (i64, i64) -> i64
        %91 = "llvm.icmp"(%90, %9) <{"predicate" = 2 : i64}> : (i64, i64) -> i1
        %92 = "llvm.zext"(%91) : (i1) -> i32
        %93 = "llvm.sext"(%92) : (i32) -> i64
        %94 = "llvm.add"(%90, %93) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        "llvm.store"(%94, %arg7_3) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i64, !llvm.ptr) -> ()
        "llvm.br"() [^40] : () -> ()
      ^40():
        "llvm.return"() : () -> ()
    }) : () -> ()
}) {"dlti.dl_spec" = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, "llvm.ident" = "clang version 22.1.8 (https://github.com/llvm/llvm-project.git ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)", "llvm.module_asm" = [], "llvm.target_triple" = "x86_64-unknown-linux-gnu"} : () -> ()
