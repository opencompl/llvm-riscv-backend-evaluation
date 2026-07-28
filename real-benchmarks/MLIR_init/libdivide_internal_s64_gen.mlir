"builtin.module"() ({
  ^4():
    "llvm.module_flags"() <{"flags" = [#llvm.mlir.module_flag<error, "wchar_size", 4 : i32>, #llvm.mlir.module_flag<min, "PIC Level", 2 : i32>, #llvm.mlir.module_flag<max, "PIE Level", 2 : i32>, #llvm.mlir.module_flag<max, "uwtable", 2 : i32>, #llvm.mlir.module_flag<max, "frame-pointer", 2 : i32>]}> : () -> ()
    "llvm.func"() <{"CConv" = #llvm.cconv<ccc>, always_inline, "arg_attrs" = [{llvm.noundef}, {llvm.noundef}, {llvm.noundef}], dso_local, "frame_pointer" = #llvm.framePointerKind<all>, "function_type" = !llvm.func<void (i64, i32, !llvm.ptr)>, "linkage" = #llvm.linkage<external>, no_unwind, "passthrough" = [["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], "sym_name" = "libdivide_internal_s64_gen", "target_cpu" = "x86-64", "target_features" = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, "tune_cpu" = "generic", "unnamed_addr" = 0 : i64, "uwtable_kind" = #llvm.uwtableKind<async>, "visibility_" = 0 : i64}> ({
      ^7(%arg7_0 : i64, %arg7_1 : i32, %arg7_2 : !llvm.ptr):
        %8 = "llvm.mlir.constant"() <{"value" = 1 : i32}> : () -> i32
        %9 = "llvm.mlir.constant"() <{"value" = 0 : i64}> : () -> i64
        %10 = "llvm.mlir.constant"() <{"value" = 32 : i64}> : () -> i64
        %11 = "llvm.mlir.constant"() <{"value" = 4294967295 : i64}> : () -> i64
        %12 = "llvm.mlir.constant"() <{"value" = 0 : i32}> : () -> i32
        %13 = "llvm.mlir.constant"() <{"value" = -16777216 : i32}> : () -> i32
        %14 = "llvm.mlir.constant"() <{"value" = 8 : i32}> : () -> i32
        %15 = "llvm.mlir.constant"() <{"value" = 32 : i32}> : () -> i32
        %16 = "llvm.mlir.constant"() <{"value" = 63 : i32}> : () -> i32
        %17 = "llvm.mlir.constant"() <{"value" = 1 : i64}> : () -> i64
        %18 = "llvm.mlir.constant"() <{"value" = 63 : i64}> : () -> i64
        %19 = "llvm.mlir.constant"() <{"value" = 4294967296 : i64}> : () -> i64
        %20 = "llvm.mlir.constant"() <{"value" = 2 : i32}> : () -> i32
        %21 = "llvm.mlir.zero"() : () -> !llvm.ptr
        %22 = "llvm.mlir.constant"() <{"value" = -1 : i64}> : () -> i64
        %23 = "llvm.mlir.constant"() <{"value" = 64 : i32}> : () -> i32
        %24 = "llvm.mlir.constant"() <{"value" = 128 : i32}> : () -> i32
        %25 = "llvm.mlir.constant"() <{"value" = 8 : i64}> : () -> i64
        %26 = "llvm.mlir.constant"() <{"value" = 9 : i64}> : () -> i64
        %27 = "llvm.mlir.constant"() <{"value" = 7 : i64}> : () -> i64
        %28 = "llvm.alloca"(%8) <{"alignment" = 1 : i64, "elem_type" = !llvm.array<7 x i8>}> : (i32) -> !llvm.ptr
        %29 = "llvm.alloca"(%8) <{"alignment" = 8 : i64, "elem_type" = i64}> : (i32) -> !llvm.ptr
        %30 = "llvm.icmp"(%arg7_0, %9) <{"predicate" = 2 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%30) [^31, ^32] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^31():
        %34 = "llvm.sub"(%9, %arg7_0) : (i64, i64) -> i64
        "llvm.br"(%34) [^35] : (i64) -> ()
      ^32():
        "llvm.br"(%arg7_0) [^35] : (i64) -> ()
      ^35(%arg35_0 : i64):
        %38 = "llvm.lshr"(%arg35_0, %10) : (i64, i64) -> i64
        %39 = "llvm.trunc"(%38) : (i64) -> i32
        %40 = "llvm.and"(%arg35_0, %11) : (i64, i64) -> i64
        %41 = "llvm.trunc"(%40) : (i64) -> i32
        %42 = "llvm.icmp"(%39, %12) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%42) [^43, ^44] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^43():
        %46 = "llvm.icmp"(%39, %12) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%46) [^47, ^48] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^47():
        "llvm.br"(%15) [^50] : (i32) -> ()
      ^48():
        "llvm.br"(%13, %14) [^52] : (i32, i32) -> ()
      ^52(%arg52_0 : i32, %arg52_1 : i32):
        %54 = "llvm.and"(%39, %arg52_0) : (i32, i32) -> i32
        %55 = "llvm.icmp"(%54, %12) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%55) [^56, ^57] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^56():
        %59 = "llvm.lshr"(%arg52_0, %14) : (i32, i32) -> i32
        %60 = "llvm.add"(%arg52_1, %14) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%59, %60) [^52] : (i32, i32) -> ()
      ^57():
        "llvm.br"(%arg52_0, %arg52_1) [^62] : (i32, i32) -> ()
      ^62(%arg62_0 : i32, %arg62_1 : i32):
        %64 = "llvm.and"(%39, %arg62_0) : (i32, i32) -> i32
        %65 = "llvm.icmp"(%64, %12) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%65) [^66, ^67] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^66():
        %69 = "llvm.sub"(%arg62_1, %8) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %70 = "llvm.shl"(%arg62_0, %8) : (i32, i32) -> i32
        "llvm.br"(%70, %69) [^62] : (i32, i32) -> ()
      ^67():
        "llvm.br"(%arg62_1) [^50] : (i32) -> ()
      ^50(%arg50_0 : i32):
        "llvm.br"(%arg50_0) [^73] : (i32) -> ()
      ^44():
        %75 = "llvm.icmp"(%41, %12) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%75) [^76, ^77] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^76():
        "llvm.br"(%15) [^79] : (i32) -> ()
      ^77():
        "llvm.br"(%13, %14) [^81] : (i32, i32) -> ()
      ^81(%arg81_0 : i32, %arg81_1 : i32):
        %83 = "llvm.and"(%41, %arg81_0) : (i32, i32) -> i32
        %84 = "llvm.icmp"(%83, %12) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%84) [^85, ^86] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^85():
        %88 = "llvm.lshr"(%arg81_0, %14) : (i32, i32) -> i32
        %89 = "llvm.add"(%arg81_1, %14) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%88, %89) [^81] : (i32, i32) -> ()
      ^86():
        "llvm.br"(%arg81_0, %arg81_1) [^91] : (i32, i32) -> ()
      ^91(%arg91_0 : i32, %arg91_1 : i32):
        %93 = "llvm.and"(%41, %arg91_0) : (i32, i32) -> i32
        %94 = "llvm.icmp"(%93, %12) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%94) [^95, ^96] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^95():
        %98 = "llvm.sub"(%arg91_1, %8) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %99 = "llvm.shl"(%arg91_0, %8) : (i32, i32) -> i32
        "llvm.br"(%99, %98) [^91] : (i32, i32) -> ()
      ^96():
        "llvm.br"(%arg91_1) [^79] : (i32) -> ()
      ^79(%arg79_0 : i32):
        %102 = "llvm.add"(%15, %arg79_0) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%102) [^73] : (i32) -> ()
      ^73(%arg73_0 : i32):
        %104 = "llvm.sub"(%16, %arg73_0) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %105 = "llvm.sub"(%arg35_0, %17) : (i64, i64) -> i64
        %106 = "llvm.and"(%arg35_0, %105) : (i64, i64) -> i64
        %107 = "llvm.icmp"(%106, %9) <{"predicate" = 0 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%107) [^108, ^109] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^108():
        %111 = "llvm.icmp"(%arg7_0, %9) <{"predicate" = 2 : i64}> : (i64, i64) -> i1
        %113 = "llvm.select"(%111, %24, %12) : (i1, i32, i32) -> i32
        %114 = "llvm.or"(%104, %113) : (i32, i32) -> i32
        %115 = "llvm.trunc"(%114) : (i32) -> i8
        "llvm.br"(%115, %9) [^116] : (i8, i64) -> ()
      ^109():
        %118 = "llvm.sub"(%104, %8) : (i32, i32) -> i32
        %119 = "llvm.zext"(%118) : (i32) -> i64
        %120 = "llvm.shl"(%17, %119) : (i64, i64) -> i64
        %121 = "llvm.icmp"(%120, %arg35_0) <{"predicate" = 9 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%121) [^122, ^123] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^122():
        %125 = "llvm.icmp"(%29, %21) <{"predicate" = 1 : i64}> : (!llvm.ptr, !llvm.ptr) -> i1
        "llvm.cond_br"(%125) [^126, ^127] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^126():
        "llvm.store"(%22, %29) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i64, !llvm.ptr) -> ()
        "llvm.br"() [^127] : () -> ()
      ^127():
        "llvm.br"(%22) [^131] : (i64) -> ()
      ^123():
        %133 = "llvm.lshr"(%arg35_0, %10) : (i64, i64) -> i64
        %134 = "llvm.trunc"(%133) : (i64) -> i32
        %135 = "llvm.and"(%arg35_0, %11) : (i64, i64) -> i64
        %136 = "llvm.trunc"(%135) : (i64) -> i32
        %137 = "llvm.icmp"(%134, %12) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%137) [^138, ^139] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^138():
        %141 = "llvm.icmp"(%134, %12) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%141) [^142, ^143] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^142():
        "llvm.br"(%15) [^145] : (i32) -> ()
      ^143():
        "llvm.br"(%13, %14) [^147] : (i32, i32) -> ()
      ^147(%arg147_0 : i32, %arg147_1 : i32):
        %149 = "llvm.and"(%134, %arg147_0) : (i32, i32) -> i32
        %150 = "llvm.icmp"(%149, %12) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%150) [^151, ^152] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^151():
        %154 = "llvm.lshr"(%arg147_0, %14) : (i32, i32) -> i32
        %155 = "llvm.add"(%arg147_1, %14) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%154, %155) [^147] : (i32, i32) -> ()
      ^152():
        "llvm.br"(%arg147_0, %arg147_1) [^157] : (i32, i32) -> ()
      ^157(%arg157_0 : i32, %arg157_1 : i32):
        %159 = "llvm.and"(%134, %arg157_0) : (i32, i32) -> i32
        %160 = "llvm.icmp"(%159, %12) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%160) [^161, ^162] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^161():
        %164 = "llvm.sub"(%arg157_1, %8) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %165 = "llvm.shl"(%arg157_0, %8) : (i32, i32) -> i32
        "llvm.br"(%165, %164) [^157] : (i32, i32) -> ()
      ^162():
        "llvm.br"(%arg157_1) [^145] : (i32) -> ()
      ^145(%arg145_0 : i32):
        "llvm.br"(%arg145_0) [^168] : (i32) -> ()
      ^139():
        %170 = "llvm.icmp"(%136, %12) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%170) [^171, ^172] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^171():
        "llvm.br"(%15) [^174] : (i32) -> ()
      ^172():
        "llvm.br"(%13, %14) [^176] : (i32, i32) -> ()
      ^176(%arg176_0 : i32, %arg176_1 : i32):
        %178 = "llvm.and"(%136, %arg176_0) : (i32, i32) -> i32
        %179 = "llvm.icmp"(%178, %12) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%179) [^180, ^181] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^180():
        %183 = "llvm.lshr"(%arg176_0, %14) : (i32, i32) -> i32
        %184 = "llvm.add"(%arg176_1, %14) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%183, %184) [^176] : (i32, i32) -> ()
      ^181():
        "llvm.br"(%arg176_0, %arg176_1) [^186] : (i32, i32) -> ()
      ^186(%arg186_0 : i32, %arg186_1 : i32):
        %188 = "llvm.and"(%136, %arg186_0) : (i32, i32) -> i32
        %189 = "llvm.icmp"(%188, %12) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%189) [^190, ^191] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^190():
        %193 = "llvm.sub"(%arg186_1, %8) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %194 = "llvm.shl"(%arg186_0, %8) : (i32, i32) -> i32
        "llvm.br"(%194, %193) [^186] : (i32, i32) -> ()
      ^191():
        "llvm.br"(%arg186_1) [^174] : (i32) -> ()
      ^174(%arg174_0 : i32):
        %197 = "llvm.add"(%15, %arg174_0) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%197) [^168] : (i32) -> ()
      ^168(%arg168_0 : i32):
        %199 = "llvm.zext"(%arg168_0) : (i32) -> i64
        %200 = "llvm.shl"(%arg35_0, %199) : (i64, i64) -> i64
        %201 = "llvm.zext"(%arg168_0) : (i32) -> i64
        %202 = "llvm.shl"(%120, %201) : (i64, i64) -> i64
        %203 = "llvm.sub"(%12, %arg168_0) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %204 = "llvm.and"(%203, %16) : (i32, i32) -> i32
        %205 = "llvm.zext"(%204) : (i32) -> i64
        %206 = "llvm.lshr"(%9, %205) : (i64, i64) -> i64
        %207 = "llvm.sext"(%arg168_0) : (i32) -> i64
        %208 = "llvm.sub"(%9, %207) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %209 = "llvm.ashr"(%208, %18) : (i64, i64) -> i64
        %210 = "llvm.and"(%206, %209) : (i64, i64) -> i64
        %211 = "llvm.or"(%202, %210) : (i64, i64) -> i64
        %212 = "llvm.zext"(%arg168_0) : (i32) -> i64
        %213 = "llvm.shl"(%9, %212) : (i64, i64) -> i64
        %214 = "llvm.lshr"(%213, %10) : (i64, i64) -> i64
        %215 = "llvm.trunc"(%214) : (i64) -> i32
        %216 = "llvm.and"(%213, %11) : (i64, i64) -> i64
        %217 = "llvm.trunc"(%216) : (i64) -> i32
        %218 = "llvm.lshr"(%200, %10) : (i64, i64) -> i64
        %219 = "llvm.trunc"(%218) : (i64) -> i32
        %220 = "llvm.and"(%200, %11) : (i64, i64) -> i64
        %221 = "llvm.trunc"(%220) : (i64) -> i32
        %222 = "llvm.zext"(%219) : (i32) -> i64
        %223 = "llvm.udiv"(%211, %222) : (i64, i64) -> i64
        %224 = "llvm.zext"(%219) : (i32) -> i64
        %225 = "llvm.urem"(%211, %224) : (i64, i64) -> i64
        %226 = "llvm.zext"(%221) : (i32) -> i64
        %227 = "llvm.mul"(%223, %226) : (i64, i64) -> i64
        %228 = "llvm.mul"(%225, %19) : (i64, i64) -> i64
        %229 = "llvm.zext"(%215) : (i32) -> i64
        %230 = "llvm.add"(%228, %229) : (i64, i64) -> i64
        %231 = "llvm.icmp"(%227, %230) <{"predicate" = 8 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%231, %223) [^232, ^233] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 1>}> : (i1, i64) -> ()
      ^232():
        %235 = "llvm.sub"(%227, %230) : (i64, i64) -> i64
        %236 = "llvm.icmp"(%235, %200) <{"predicate" = 8 : i64}> : (i64, i64) -> i1
        %238 = "llvm.select"(%236, %20, %8) : (i1, i32, i32) -> i32
        %239 = "llvm.sext"(%238) : (i32) -> i64
        %240 = "llvm.sub"(%223, %239) : (i64, i64) -> i64
        "llvm.br"(%240) [^233] : (i64) -> ()
      ^233(%arg233_0 : i64):
        %242 = "llvm.trunc"(%arg233_0) : (i64) -> i32
        %243 = "llvm.mul"(%211, %19) : (i64, i64) -> i64
        %244 = "llvm.zext"(%215) : (i32) -> i64
        %245 = "llvm.add"(%243, %244) : (i64, i64) -> i64
        %246 = "llvm.zext"(%242) : (i32) -> i64
        %247 = "llvm.mul"(%246, %200) : (i64, i64) -> i64
        %248 = "llvm.sub"(%245, %247) : (i64, i64) -> i64
        %249 = "llvm.zext"(%219) : (i32) -> i64
        %250 = "llvm.udiv"(%248, %249) : (i64, i64) -> i64
        %251 = "llvm.zext"(%219) : (i32) -> i64
        %252 = "llvm.urem"(%248, %251) : (i64, i64) -> i64
        %253 = "llvm.zext"(%221) : (i32) -> i64
        %254 = "llvm.mul"(%250, %253) : (i64, i64) -> i64
        %255 = "llvm.mul"(%252, %19) : (i64, i64) -> i64
        %256 = "llvm.zext"(%217) : (i32) -> i64
        %257 = "llvm.add"(%255, %256) : (i64, i64) -> i64
        %258 = "llvm.icmp"(%254, %257) <{"predicate" = 8 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%258, %250) [^259, ^260] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 1>}> : (i1, i64) -> ()
      ^259():
        %262 = "llvm.sub"(%254, %257) : (i64, i64) -> i64
        %263 = "llvm.icmp"(%262, %200) <{"predicate" = 8 : i64}> : (i64, i64) -> i1
        %265 = "llvm.select"(%263, %20, %8) : (i1, i32, i32) -> i32
        %266 = "llvm.sext"(%265) : (i32) -> i64
        %267 = "llvm.sub"(%250, %266) : (i64, i64) -> i64
        "llvm.br"(%267) [^260] : (i64) -> ()
      ^260(%arg260_0 : i64):
        %269 = "llvm.trunc"(%arg260_0) : (i64) -> i32
        %270 = "llvm.zext"(%242) : (i32) -> i64
        %271 = "llvm.shl"(%270, %10) : (i64, i64) -> i64
        %272 = "llvm.zext"(%269) : (i32) -> i64
        %273 = "llvm.or"(%271, %272) : (i64, i64) -> i64
        %274 = "llvm.icmp"(%29, %21) <{"predicate" = 1 : i64}> : (!llvm.ptr, !llvm.ptr) -> i1
        "llvm.cond_br"(%274) [^275, ^276] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^275():
        %278 = "llvm.mul"(%273, %arg35_0) : (i64, i64) -> i64
        %279 = "llvm.sub"(%9, %278) : (i64, i64) -> i64
        "llvm.store"(%279, %29) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i64, !llvm.ptr) -> ()
        "llvm.br"() [^276] : () -> ()
      ^276():
        "llvm.br"(%273) [^131] : (i64) -> ()
      ^131(%arg131_0 : i64):
        %283 = "llvm.load"(%29) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i64
        %284 = "llvm.sub"(%arg35_0, %283) : (i64, i64) -> i64
        %285 = "llvm.icmp"(%arg7_1, %12) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%285) [^286, ^287] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^287():
        %289 = "llvm.zext"(%104) : (i32) -> i64
        %290 = "llvm.shl"(%17, %289) : (i64, i64) -> i64
        %291 = "llvm.icmp"(%284, %290) <{"predicate" = 6 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%291) [^292, ^286] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^292():
        %294 = "llvm.sub"(%104, %8) : (i32, i32) -> i32
        %295 = "llvm.trunc"(%294) : (i32) -> i8
        "llvm.br"(%295, %arg131_0) [^296] : (i8, i64) -> ()
      ^286():
        %298 = "llvm.add"(%arg131_0, %arg131_0) : (i64, i64) -> i64
        %299 = "llvm.load"(%29) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i64
        %300 = "llvm.load"(%29) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i64
        %301 = "llvm.add"(%299, %300) : (i64, i64) -> i64
        %302 = "llvm.icmp"(%301, %arg35_0) <{"predicate" = 9 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%302) [^303, ^304] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^304():
        %306 = "llvm.load"(%29) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i64
        %307 = "llvm.icmp"(%301, %306) <{"predicate" = 6 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%307, %298) [^303, ^308] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 1>}> : (i1, i64) -> ()
      ^303():
        %310 = "llvm.add"(%298, %17) : (i64, i64) -> i64
        "llvm.br"(%310) [^308] : (i64) -> ()
      ^308(%arg308_0 : i64):
        %312 = "llvm.or"(%104, %23) : (i32, i32) -> i32
        %313 = "llvm.trunc"(%312) : (i32) -> i8
        "llvm.br"(%313, %arg308_0) [^296] : (i8, i64) -> ()
      ^296(%arg296_0 : i8, %arg296_1 : i64):
        %315 = "llvm.add"(%arg296_1, %17) : (i64, i64) -> i64
        %316 = "llvm.icmp"(%arg7_0, %9) <{"predicate" = 2 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%316, %arg296_0, %315) [^317, ^318] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 2>}> : (i1, i8, i64) -> ()
      ^317():
        %320 = "llvm.zext"(%arg296_0) : (i8) -> i32
        %321 = "llvm.or"(%320, %24) : (i32, i32) -> i32
        %322 = "llvm.trunc"(%321) : (i32) -> i8
        %323 = "llvm.icmp"(%arg7_1, %12) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%323, %315) [^324, ^325] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 1, 0>}> : (i1, i64) -> ()
      ^325():
        %327 = "llvm.sub"(%9, %315) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        "llvm.br"(%327) [^324] : (i64) -> ()
      ^324(%arg324_0 : i64):
        "llvm.br"(%322, %arg324_0) [^318] : (i8, i64) -> ()
      ^318(%arg318_0 : i8, %arg318_1 : i64):
        "llvm.br"(%arg318_0, %arg318_1) [^116] : (i8, i64) -> ()
      ^116(%arg116_0 : i8, %arg116_1 : i64):
        "llvm.store"(%arg116_1, %arg7_2) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i64, !llvm.ptr) -> ()
        %332 = "llvm.getelementptr"(%arg7_2, %25) <{"elem_type" = i8, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.store"(%arg116_0, %332) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i8, !llvm.ptr) -> ()
        %334 = "llvm.getelementptr"(%arg7_2, %26) <{"elem_type" = i8, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.intr.memcpy"(%334, %28, %27) <{"arg_attrs" = [{"llvm.align" = 1 : i64}, {"llvm.align" = 1 : i64}, {}], "isVolatile" = 0 : i1}> : (!llvm.ptr, !llvm.ptr, i64) -> ()
        "llvm.return"() : () -> ()
    }) : () -> ()
}) {"dlti.dl_spec" = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, "llvm.ident" = "Ubuntu clang version 18.1.3 (1ubuntu1)", "llvm.module_asm" = [], "llvm.target_triple" = "x86_64-pc-linux-gnu"} : () -> ()
