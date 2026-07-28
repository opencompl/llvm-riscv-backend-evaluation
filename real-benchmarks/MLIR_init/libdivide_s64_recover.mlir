"builtin.module"() ({
  ^4():
    "llvm.module_flags"() <{"flags" = [#llvm.mlir.module_flag<error, "wchar_size", 4 : i32>, #llvm.mlir.module_flag<min, "PIC Level", 2 : i32>, #llvm.mlir.module_flag<max, "PIE Level", 2 : i32>, #llvm.mlir.module_flag<max, "uwtable", 2 : i32>, #llvm.mlir.module_flag<max, "frame-pointer", 2 : i32>]}> : () -> ()
    "llvm.func"() <{"CConv" = #llvm.cconv<ccc>, always_inline, "arg_attrs" = [{llvm.noundef}, {llvm.noundef}], dso_local, "frame_pointer" = #llvm.framePointerKind<all>, "function_type" = !llvm.func<void (!llvm.ptr, !llvm.ptr)>, "linkage" = #llvm.linkage<external>, no_unwind, "passthrough" = [["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], "sym_name" = "libdivide_s64_recover", "target_cpu" = "x86-64", "target_features" = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, "tune_cpu" = "generic", "unnamed_addr" = 0 : i64, "uwtable_kind" = #llvm.uwtableKind<async>, "visibility_" = 0 : i64}> ({
      ^7(%arg7_0 : !llvm.ptr, %arg7_1 : !llvm.ptr):
        %8 = "llvm.mlir.constant"() <{"value" = 1 : i32}> : () -> i32
        %9 = "llvm.mlir.constant"() <{"value" = 0 : i32}> : () -> i32
        %10 = "llvm.mlir.constant"() <{"value" = 63 : i32}> : () -> i32
        %11 = "llvm.mlir.constant"() <{"value" = 0 : i64}> : () -> i64
        %12 = "llvm.mlir.constant"() <{"value" = 128 : i32}> : () -> i32
        %13 = "llvm.mlir.constant"() <{"value" = 64 : i32}> : () -> i32
        %14 = "llvm.mlir.constant"() <{"value" = 1 : i64}> : () -> i64
        %15 = "llvm.mlir.constant"() <{"value" = 63 : i64}> : () -> i64
        %16 = "llvm.mlir.constant"() <{"value" = 32 : i64}> : () -> i64
        %17 = "llvm.mlir.constant"() <{"value" = 4294967295 : i64}> : () -> i64
        %18 = "llvm.mlir.constant"() <{"value" = 4294967296 : i64}> : () -> i64
        %19 = "llvm.mlir.constant"() <{"value" = 2 : i32}> : () -> i32
        %20 = "llvm.mlir.zero"() : () -> !llvm.ptr
        %21 = "llvm.mlir.constant"() <{"value" = -1 : i64}> : () -> i64
        %22 = "llvm.alloca"(%8) <{"alignment" = 8 : i64, "elem_type" = i64}> : (i32) -> !llvm.ptr
        %23 = "llvm.getelementptr"(%arg7_0, %9) <{"elem_type" = !llvm.struct<"struct.libdivide_s64_t", (i64, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 1>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %24 = "llvm.load"(%23) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i8
        %25 = "llvm.zext"(%24) : (i8) -> i32
        %26 = "llvm.and"(%25, %10) : (i32, i32) -> i32
        %27 = "llvm.trunc"(%26) : (i32) -> i8
        %28 = "llvm.getelementptr"(%arg7_0, %9) <{"elem_type" = !llvm.struct<"struct.libdivide_s64_t", (i64, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %29 = "llvm.load"(%28) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i64
        %30 = "llvm.icmp"(%29, %11) <{"predicate" = 0 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%30) [^31, ^32] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^31():
        %34 = "llvm.zext"(%27) : (i8) -> i32
        %35 = "llvm.zext"(%34) : (i32) -> i64
        %36 = "llvm.shl"(%14, %35) : (i64, i64) -> i64
        %37 = "llvm.zext"(%24) : (i8) -> i32
        %38 = "llvm.and"(%37, %12) : (i32, i32) -> i32
        %39 = "llvm.icmp"(%38, %9) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%39, %36) [^40, ^41] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 1>}> : (i1, i64) -> ()
      ^40():
        %43 = "llvm.sub"(%11, %36) : (i64, i64) -> i64
        "llvm.br"(%43) [^41] : (i64) -> ()
      ^41(%arg41_0 : i64):
        "llvm.store"(%arg41_0, %arg7_1) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i64, !llvm.ptr) -> ()
        "llvm.br"() [^46] : () -> ()
      ^32():
        %48 = "llvm.zext"(%24) : (i8) -> i32
        %49 = "llvm.and"(%48, %12) : (i32, i32) -> i32
        %50 = "llvm.zext"(%24) : (i8) -> i32
        %51 = "llvm.and"(%50, %13) : (i32, i32) -> i32
        %52 = "llvm.icmp"(%51, %9) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%52) [^53, ^54] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^53():
        %56 = "llvm.getelementptr"(%arg7_0, %9) <{"elem_type" = !llvm.struct<"struct.libdivide_s64_t", (i64, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %57 = "llvm.load"(%56) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i64
        %58 = "llvm.icmp"(%57, %11) <{"predicate" = 4 : i64}> : (i64, i64) -> i1
        %59 = "llvm.zext"(%58) : (i1) -> i32
        "llvm.br"(%59) [^60] : (i32) -> ()
      ^54():
        %62 = "llvm.getelementptr"(%arg7_0, %9) <{"elem_type" = !llvm.struct<"struct.libdivide_s64_t", (i64, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %63 = "llvm.load"(%62) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i64
        %64 = "llvm.icmp"(%63, %11) <{"predicate" = 2 : i64}> : (i64, i64) -> i1
        %65 = "llvm.zext"(%64) : (i1) -> i32
        "llvm.br"(%65) [^60] : (i32) -> ()
      ^60(%arg60_0 : i32):
        %67 = "llvm.icmp"(%arg60_0, %9) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%67) [^68, ^69] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^68():
        %71 = "llvm.getelementptr"(%arg7_0, %9) <{"elem_type" = !llvm.struct<"struct.libdivide_s64_t", (i64, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %72 = "llvm.load"(%71) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i64
        %73 = "llvm.sub"(%11, %72) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        "llvm.br"(%73) [^74] : (i64) -> ()
      ^69():
        %76 = "llvm.getelementptr"(%arg7_0, %9) <{"elem_type" = !llvm.struct<"struct.libdivide_s64_t", (i64, i8)>, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648, 0>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %77 = "llvm.load"(%76) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i64
        "llvm.br"(%77) [^74] : (i64) -> ()
      ^74(%arg74_0 : i64):
        %79 = "llvm.zext"(%27) : (i8) -> i32
        %80 = "llvm.zext"(%79) : (i32) -> i64
        %81 = "llvm.shl"(%14, %80) : (i64, i64) -> i64
        %82 = "llvm.icmp"(%81, %arg74_0) <{"predicate" = 9 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%82) [^83, ^84] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^83():
        %86 = "llvm.icmp"(%22, %20) <{"predicate" = 1 : i64}> : (!llvm.ptr, !llvm.ptr) -> i1
        "llvm.cond_br"(%86) [^87, ^88] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^87():
        "llvm.store"(%21, %22) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i64, !llvm.ptr) -> ()
        "llvm.br"() [^88] : () -> ()
      ^88():
        "llvm.br"(%21) [^92] : (i64) -> ()
      ^84():
        %94 = "llvm.intr.ctlz"(%arg74_0) <{"is_zero_poison" = 1 : i1}> : (i64) -> i64
        %95 = "llvm.trunc"(%94) : (i64) -> i32
        %96 = "llvm.zext"(%95) : (i32) -> i64
        %97 = "llvm.shl"(%arg74_0, %96) : (i64, i64) -> i64
        %98 = "llvm.zext"(%95) : (i32) -> i64
        %99 = "llvm.shl"(%81, %98) : (i64, i64) -> i64
        %100 = "llvm.sub"(%9, %95) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %101 = "llvm.and"(%100, %10) : (i32, i32) -> i32
        %102 = "llvm.zext"(%101) : (i32) -> i64
        %103 = "llvm.lshr"(%11, %102) : (i64, i64) -> i64
        %104 = "llvm.sext"(%95) : (i32) -> i64
        %105 = "llvm.sub"(%11, %104) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %106 = "llvm.ashr"(%105, %15) : (i64, i64) -> i64
        %107 = "llvm.and"(%103, %106) : (i64, i64) -> i64
        %108 = "llvm.or"(%99, %107) : (i64, i64) -> i64
        %109 = "llvm.zext"(%95) : (i32) -> i64
        %110 = "llvm.shl"(%11, %109) : (i64, i64) -> i64
        %111 = "llvm.lshr"(%110, %16) : (i64, i64) -> i64
        %112 = "llvm.trunc"(%111) : (i64) -> i32
        %113 = "llvm.and"(%110, %17) : (i64, i64) -> i64
        %114 = "llvm.trunc"(%113) : (i64) -> i32
        %115 = "llvm.lshr"(%97, %16) : (i64, i64) -> i64
        %116 = "llvm.trunc"(%115) : (i64) -> i32
        %117 = "llvm.and"(%97, %17) : (i64, i64) -> i64
        %118 = "llvm.trunc"(%117) : (i64) -> i32
        %119 = "llvm.zext"(%116) : (i32) -> i64
        %120 = "llvm.udiv"(%108, %119) : (i64, i64) -> i64
        %121 = "llvm.zext"(%116) : (i32) -> i64
        %122 = "llvm.urem"(%108, %121) : (i64, i64) -> i64
        %123 = "llvm.zext"(%118) : (i32) -> i64
        %124 = "llvm.mul"(%120, %123) : (i64, i64) -> i64
        %125 = "llvm.mul"(%122, %18) : (i64, i64) -> i64
        %126 = "llvm.zext"(%112) : (i32) -> i64
        %127 = "llvm.add"(%125, %126) : (i64, i64) -> i64
        %128 = "llvm.icmp"(%124, %127) <{"predicate" = 8 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%128, %120) [^129, ^130] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 1>}> : (i1, i64) -> ()
      ^129():
        %132 = "llvm.sub"(%124, %127) : (i64, i64) -> i64
        %133 = "llvm.icmp"(%132, %97) <{"predicate" = 8 : i64}> : (i64, i64) -> i1
        %135 = "llvm.select"(%133, %19, %8) : (i1, i32, i32) -> i32
        %136 = "llvm.sext"(%135) : (i32) -> i64
        %137 = "llvm.sub"(%120, %136) : (i64, i64) -> i64
        "llvm.br"(%137) [^130] : (i64) -> ()
      ^130(%arg130_0 : i64):
        %139 = "llvm.trunc"(%arg130_0) : (i64) -> i32
        %140 = "llvm.mul"(%108, %18) : (i64, i64) -> i64
        %141 = "llvm.zext"(%112) : (i32) -> i64
        %142 = "llvm.add"(%140, %141) : (i64, i64) -> i64
        %143 = "llvm.zext"(%139) : (i32) -> i64
        %144 = "llvm.mul"(%143, %97) : (i64, i64) -> i64
        %145 = "llvm.sub"(%142, %144) : (i64, i64) -> i64
        %146 = "llvm.zext"(%116) : (i32) -> i64
        %147 = "llvm.udiv"(%145, %146) : (i64, i64) -> i64
        %148 = "llvm.zext"(%116) : (i32) -> i64
        %149 = "llvm.urem"(%145, %148) : (i64, i64) -> i64
        %150 = "llvm.zext"(%118) : (i32) -> i64
        %151 = "llvm.mul"(%147, %150) : (i64, i64) -> i64
        %152 = "llvm.mul"(%149, %18) : (i64, i64) -> i64
        %153 = "llvm.zext"(%114) : (i32) -> i64
        %154 = "llvm.add"(%152, %153) : (i64, i64) -> i64
        %155 = "llvm.icmp"(%151, %154) <{"predicate" = 8 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%155, %147) [^156, ^157] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 1>}> : (i1, i64) -> ()
      ^156():
        %159 = "llvm.sub"(%151, %154) : (i64, i64) -> i64
        %160 = "llvm.icmp"(%159, %97) <{"predicate" = 8 : i64}> : (i64, i64) -> i1
        %162 = "llvm.select"(%160, %19, %8) : (i1, i32, i32) -> i32
        %163 = "llvm.sext"(%162) : (i32) -> i64
        %164 = "llvm.sub"(%147, %163) : (i64, i64) -> i64
        "llvm.br"(%164) [^157] : (i64) -> ()
      ^157(%arg157_0 : i64):
        %166 = "llvm.trunc"(%arg157_0) : (i64) -> i32
        %167 = "llvm.zext"(%139) : (i32) -> i64
        %168 = "llvm.shl"(%167, %16) : (i64, i64) -> i64
        %169 = "llvm.zext"(%166) : (i32) -> i64
        %170 = "llvm.or"(%168, %169) : (i64, i64) -> i64
        %171 = "llvm.icmp"(%22, %20) <{"predicate" = 1 : i64}> : (!llvm.ptr, !llvm.ptr) -> i1
        "llvm.cond_br"(%171) [^172, ^173] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^172():
        %175 = "llvm.mul"(%170, %arg74_0) : (i64, i64) -> i64
        %176 = "llvm.sub"(%11, %175) : (i64, i64) -> i64
        "llvm.store"(%176, %22) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i64, !llvm.ptr) -> ()
        "llvm.br"() [^173] : () -> ()
      ^173():
        "llvm.br"(%170) [^92] : (i64) -> ()
      ^92(%arg92_0 : i64):
        %180 = "llvm.add"(%arg92_0, %14) : (i64, i64) -> i64
        %181 = "llvm.icmp"(%49, %9) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%181, %180) [^182, ^183] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 1>}> : (i1, i64) -> ()
      ^182():
        %185 = "llvm.sub"(%11, %180) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        "llvm.br"(%185) [^183] : (i64) -> ()
      ^183(%arg183_0 : i64):
        "llvm.store"(%arg183_0, %arg7_1) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i64, !llvm.ptr) -> ()
        "llvm.br"() [^46] : () -> ()
      ^46():
        "llvm.return"() : () -> ()
    }) : () -> ()
}) {"dlti.dl_spec" = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, "llvm.ident" = "Ubuntu clang version 18.1.3 (1ubuntu1)", "llvm.module_asm" = [], "llvm.target_triple" = "x86_64-pc-linux-gnu"} : () -> ()
