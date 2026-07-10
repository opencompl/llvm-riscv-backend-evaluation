"builtin.module"() ({
  ^4():
    "llvm.module_flags"() <{"flags" = [#llvm.mlir.module_flag<error, "wchar_size", 4 : i32>, #llvm.mlir.module_flag<min, "PIC Level", 2 : i32>, #llvm.mlir.module_flag<max, "PIE Level", 2 : i32>, #llvm.mlir.module_flag<max, "uwtable", 2 : i32>, #llvm.mlir.module_flag<max, "frame-pointer", 2 : i32>]}> : () -> ()
    "llvm.func"() <{"CConv" = #llvm.cconv<ccc>, always_inline, "arg_attrs" = [{llvm.noundef}, {llvm.noundef}, {llvm.noundef}], dso_local, "frame_pointer" = #llvm.framePointerKind<all>, "function_type" = !llvm.func<void (i64, i32, !llvm.ptr)>, "linkage" = #llvm.linkage<external>, no_unwind, "passthrough" = [["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], "sym_name" = "libdivide_internal_u64_gen", "target_cpu" = "x86-64", "target_features" = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, "tune_cpu" = "generic", "unnamed_addr" = 0 : i64, "uwtable_kind" = #llvm.uwtableKind<async>, "visibility_" = 0 : i64}> ({
      ^7(%arg7_0 : i64, %arg7_1 : i32, %arg7_2 : !llvm.ptr):
        %8 = "llvm.mlir.constant"() <{"value" = 1 : i32}> : () -> i32
        %9 = "llvm.mlir.constant"() <{"value" = 32 : i64}> : () -> i64
        %10 = "llvm.mlir.constant"() <{"value" = 4294967295 : i64}> : () -> i64
        %11 = "llvm.mlir.constant"() <{"value" = 0 : i32}> : () -> i32
        %12 = "llvm.mlir.constant"() <{"value" = -16777216 : i32}> : () -> i32
        %13 = "llvm.mlir.constant"() <{"value" = 8 : i32}> : () -> i32
        %14 = "llvm.mlir.constant"() <{"value" = 32 : i32}> : () -> i32
        %15 = "llvm.mlir.constant"() <{"value" = 63 : i32}> : () -> i32
        %16 = "llvm.mlir.constant"() <{"value" = 1 : i64}> : () -> i64
        %17 = "llvm.mlir.constant"() <{"value" = 0 : i64}> : () -> i64
        %18 = "llvm.mlir.constant"() <{"value" = 63 : i64}> : () -> i64
        %19 = "llvm.mlir.constant"() <{"value" = 4294967296 : i64}> : () -> i64
        %20 = "llvm.mlir.constant"() <{"value" = 2 : i32}> : () -> i32
        %21 = "llvm.mlir.zero"() : () -> !llvm.ptr
        %22 = "llvm.mlir.constant"() <{"value" = -1 : i64}> : () -> i64
        %23 = "llvm.mlir.constant"() <{"value" = 64 : i32}> : () -> i32
        %24 = "llvm.mlir.constant"() <{"value" = 8 : i64}> : () -> i64
        %25 = "llvm.mlir.constant"() <{"value" = 9 : i64}> : () -> i64
        %26 = "llvm.mlir.constant"() <{"value" = 7 : i64}> : () -> i64
        %27 = "llvm.alloca"(%8) <{"alignment" = 1 : i64, "elem_type" = !llvm.array<7 x i8>}> : (i32) -> !llvm.ptr
        %28 = "llvm.alloca"(%8) <{"alignment" = 8 : i64, "elem_type" = i64}> : (i32) -> !llvm.ptr
        %29 = "llvm.lshr"(%arg7_0, %9) : (i64, i64) -> i64
        %30 = "llvm.trunc"(%29) : (i64) -> i32
        %31 = "llvm.and"(%arg7_0, %10) : (i64, i64) -> i64
        %32 = "llvm.trunc"(%31) : (i64) -> i32
        %33 = "llvm.icmp"(%30, %11) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%33) [^34, ^35] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^34():
        %37 = "llvm.icmp"(%30, %11) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%37) [^38, ^39] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^38():
        "llvm.br"(%14) [^41] : (i32) -> ()
      ^39():
        "llvm.br"(%12, %13) [^43] : (i32, i32) -> ()
      ^43(%arg43_0 : i32, %arg43_1 : i32):
        %45 = "llvm.and"(%30, %arg43_0) : (i32, i32) -> i32
        %46 = "llvm.icmp"(%45, %11) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%46) [^47, ^48] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^47():
        %50 = "llvm.lshr"(%arg43_0, %13) : (i32, i32) -> i32
        %51 = "llvm.add"(%arg43_1, %13) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%50, %51) [^43] : (i32, i32) -> ()
      ^48():
        "llvm.br"(%arg43_0, %arg43_1) [^53] : (i32, i32) -> ()
      ^53(%arg53_0 : i32, %arg53_1 : i32):
        %55 = "llvm.and"(%30, %arg53_0) : (i32, i32) -> i32
        %56 = "llvm.icmp"(%55, %11) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%56) [^57, ^58] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^57():
        %60 = "llvm.sub"(%arg53_1, %8) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %61 = "llvm.shl"(%arg53_0, %8) : (i32, i32) -> i32
        "llvm.br"(%61, %60) [^53] : (i32, i32) -> ()
      ^58():
        "llvm.br"(%arg53_1) [^41] : (i32) -> ()
      ^41(%arg41_0 : i32):
        "llvm.br"(%arg41_0) [^64] : (i32) -> ()
      ^35():
        %66 = "llvm.icmp"(%32, %11) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%66) [^67, ^68] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^67():
        "llvm.br"(%14) [^70] : (i32) -> ()
      ^68():
        "llvm.br"(%12, %13) [^72] : (i32, i32) -> ()
      ^72(%arg72_0 : i32, %arg72_1 : i32):
        %74 = "llvm.and"(%32, %arg72_0) : (i32, i32) -> i32
        %75 = "llvm.icmp"(%74, %11) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%75) [^76, ^77] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^76():
        %79 = "llvm.lshr"(%arg72_0, %13) : (i32, i32) -> i32
        %80 = "llvm.add"(%arg72_1, %13) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%79, %80) [^72] : (i32, i32) -> ()
      ^77():
        "llvm.br"(%arg72_0, %arg72_1) [^82] : (i32, i32) -> ()
      ^82(%arg82_0 : i32, %arg82_1 : i32):
        %84 = "llvm.and"(%32, %arg82_0) : (i32, i32) -> i32
        %85 = "llvm.icmp"(%84, %11) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%85) [^86, ^87] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^86():
        %89 = "llvm.sub"(%arg82_1, %8) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %90 = "llvm.shl"(%arg82_0, %8) : (i32, i32) -> i32
        "llvm.br"(%90, %89) [^82] : (i32, i32) -> ()
      ^87():
        "llvm.br"(%arg82_1) [^70] : (i32) -> ()
      ^70(%arg70_0 : i32):
        %93 = "llvm.add"(%14, %arg70_0) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%93) [^64] : (i32) -> ()
      ^64(%arg64_0 : i32):
        %95 = "llvm.sub"(%15, %arg64_0) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %96 = "llvm.sub"(%arg7_0, %16) : (i64, i64) -> i64
        %97 = "llvm.and"(%arg7_0, %96) : (i64, i64) -> i64
        %98 = "llvm.icmp"(%97, %17) <{"predicate" = 0 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%98) [^99, ^100] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^99():
        %102 = "llvm.icmp"(%arg7_1, %11) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        %103 = "llvm.zext"(%102) : (i1) -> i32
        %104 = "llvm.sub"(%95, %103) : (i32, i32) -> i32
        %105 = "llvm.trunc"(%104) : (i32) -> i8
        "llvm.br"(%105, %17) [^106] : (i8, i64) -> ()
      ^100():
        %108 = "llvm.zext"(%95) : (i32) -> i64
        %109 = "llvm.shl"(%16, %108) : (i64, i64) -> i64
        %110 = "llvm.icmp"(%109, %arg7_0) <{"predicate" = 9 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%110) [^111, ^112] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^111():
        %114 = "llvm.icmp"(%28, %21) <{"predicate" = 1 : i64}> : (!llvm.ptr, !llvm.ptr) -> i1
        "llvm.cond_br"(%114) [^115, ^116] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^115():
        "llvm.store"(%22, %28) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i64, !llvm.ptr) -> ()
        "llvm.br"() [^116] : () -> ()
      ^116():
        "llvm.br"(%22) [^120] : (i64) -> ()
      ^112():
        %122 = "llvm.lshr"(%arg7_0, %9) : (i64, i64) -> i64
        %123 = "llvm.trunc"(%122) : (i64) -> i32
        %124 = "llvm.and"(%arg7_0, %10) : (i64, i64) -> i64
        %125 = "llvm.trunc"(%124) : (i64) -> i32
        %126 = "llvm.icmp"(%123, %11) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%126) [^127, ^128] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^127():
        %130 = "llvm.icmp"(%123, %11) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%130) [^131, ^132] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^131():
        "llvm.br"(%14) [^134] : (i32) -> ()
      ^132():
        "llvm.br"(%12, %13) [^136] : (i32, i32) -> ()
      ^136(%arg136_0 : i32, %arg136_1 : i32):
        %138 = "llvm.and"(%123, %arg136_0) : (i32, i32) -> i32
        %139 = "llvm.icmp"(%138, %11) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%139) [^140, ^141] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^140():
        %143 = "llvm.lshr"(%arg136_0, %13) : (i32, i32) -> i32
        %144 = "llvm.add"(%arg136_1, %13) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%143, %144) [^136] : (i32, i32) -> ()
      ^141():
        "llvm.br"(%arg136_0, %arg136_1) [^146] : (i32, i32) -> ()
      ^146(%arg146_0 : i32, %arg146_1 : i32):
        %148 = "llvm.and"(%123, %arg146_0) : (i32, i32) -> i32
        %149 = "llvm.icmp"(%148, %11) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%149) [^150, ^151] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^150():
        %153 = "llvm.sub"(%arg146_1, %8) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %154 = "llvm.shl"(%arg146_0, %8) : (i32, i32) -> i32
        "llvm.br"(%154, %153) [^146] : (i32, i32) -> ()
      ^151():
        "llvm.br"(%arg146_1) [^134] : (i32) -> ()
      ^134(%arg134_0 : i32):
        "llvm.br"(%arg134_0) [^157] : (i32) -> ()
      ^128():
        %159 = "llvm.icmp"(%125, %11) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%159) [^160, ^161] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^160():
        "llvm.br"(%14) [^163] : (i32) -> ()
      ^161():
        "llvm.br"(%12, %13) [^165] : (i32, i32) -> ()
      ^165(%arg165_0 : i32, %arg165_1 : i32):
        %167 = "llvm.and"(%125, %arg165_0) : (i32, i32) -> i32
        %168 = "llvm.icmp"(%167, %11) <{"predicate" = 0 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%168) [^169, ^170] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^169():
        %172 = "llvm.lshr"(%arg165_0, %13) : (i32, i32) -> i32
        %173 = "llvm.add"(%arg165_1, %13) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%172, %173) [^165] : (i32, i32) -> ()
      ^170():
        "llvm.br"(%arg165_0, %arg165_1) [^175] : (i32, i32) -> ()
      ^175(%arg175_0 : i32, %arg175_1 : i32):
        %177 = "llvm.and"(%125, %arg175_0) : (i32, i32) -> i32
        %178 = "llvm.icmp"(%177, %11) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%178) [^179, ^180] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^179():
        %182 = "llvm.sub"(%arg175_1, %8) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %183 = "llvm.shl"(%arg175_0, %8) : (i32, i32) -> i32
        "llvm.br"(%183, %182) [^175] : (i32, i32) -> ()
      ^180():
        "llvm.br"(%arg175_1) [^163] : (i32) -> ()
      ^163(%arg163_0 : i32):
        %186 = "llvm.add"(%14, %arg163_0) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        "llvm.br"(%186) [^157] : (i32) -> ()
      ^157(%arg157_0 : i32):
        %188 = "llvm.zext"(%arg157_0) : (i32) -> i64
        %189 = "llvm.shl"(%arg7_0, %188) : (i64, i64) -> i64
        %191 = "llvm.shl"(%109, %188) : (i64, i64) -> i64
        %192 = "llvm.sub"(%11, %arg157_0) <{"overflowFlags" = 1 : i32}> : (i32, i32) -> i32
        %193 = "llvm.and"(%192, %15) : (i32, i32) -> i32
        %194 = "llvm.zext"(%193) : (i32) -> i64
        %195 = "llvm.lshr"(%17, %194) : (i64, i64) -> i64
        %196 = "llvm.sext"(%arg157_0) : (i32) -> i64
        %197 = "llvm.sub"(%17, %196) <{"overflowFlags" = 1 : i32}> : (i64, i64) -> i64
        %198 = "llvm.ashr"(%197, %18) : (i64, i64) -> i64
        %199 = "llvm.and"(%195, %198) : (i64, i64) -> i64
        %200 = "llvm.or"(%191, %199) : (i64, i64) -> i64
        %202 = "llvm.shl"(%17, %188) : (i64, i64) -> i64
        %203 = "llvm.lshr"(%202, %9) : (i64, i64) -> i64
        %204 = "llvm.trunc"(%203) : (i64) -> i32
        %205 = "llvm.and"(%202, %10) : (i64, i64) -> i64
        %206 = "llvm.trunc"(%205) : (i64) -> i32
        %207 = "llvm.lshr"(%189, %9) : (i64, i64) -> i64
        %208 = "llvm.trunc"(%207) : (i64) -> i32
        %209 = "llvm.and"(%189, %10) : (i64, i64) -> i64
        %210 = "llvm.trunc"(%209) : (i64) -> i32
        %211 = "llvm.zext"(%208) : (i32) -> i64
        %212 = "llvm.udiv"(%200, %211) : (i64, i64) -> i64
        %214 = "llvm.urem"(%200, %211) : (i64, i64) -> i64
        %215 = "llvm.zext"(%210) : (i32) -> i64
        %216 = "llvm.mul"(%212, %215) : (i64, i64) -> i64
        %217 = "llvm.mul"(%214, %19) : (i64, i64) -> i64
        %218 = "llvm.zext"(%204) : (i32) -> i64
        %219 = "llvm.add"(%217, %218) : (i64, i64) -> i64
        %220 = "llvm.icmp"(%216, %219) <{"predicate" = 8 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%220, %212) [^221, ^222] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 1>}> : (i1, i64) -> ()
      ^221():
        %224 = "llvm.sub"(%216, %219) : (i64, i64) -> i64
        %225 = "llvm.icmp"(%224, %189) <{"predicate" = 8 : i64}> : (i64, i64) -> i1
        %227 = "llvm.select"(%225, %20, %8) : (i1, i32, i32) -> i32
        %228 = "llvm.sext"(%227) : (i32) -> i64
        %229 = "llvm.sub"(%212, %228) : (i64, i64) -> i64
        "llvm.br"(%229) [^222] : (i64) -> ()
      ^222(%arg222_0 : i64):
        %231 = "llvm.trunc"(%arg222_0) : (i64) -> i32
        %232 = "llvm.mul"(%200, %19) : (i64, i64) -> i64
        %233 = "llvm.zext"(%204) : (i32) -> i64
        %234 = "llvm.add"(%232, %233) : (i64, i64) -> i64
        %235 = "llvm.zext"(%231) : (i32) -> i64
        %236 = "llvm.mul"(%235, %189) : (i64, i64) -> i64
        %237 = "llvm.sub"(%234, %236) : (i64, i64) -> i64
        %238 = "llvm.zext"(%208) : (i32) -> i64
        %239 = "llvm.udiv"(%237, %238) : (i64, i64) -> i64
        %241 = "llvm.urem"(%237, %238) : (i64, i64) -> i64
        %242 = "llvm.zext"(%210) : (i32) -> i64
        %243 = "llvm.mul"(%239, %242) : (i64, i64) -> i64
        %244 = "llvm.mul"(%241, %19) : (i64, i64) -> i64
        %245 = "llvm.zext"(%206) : (i32) -> i64
        %246 = "llvm.add"(%244, %245) : (i64, i64) -> i64
        %247 = "llvm.icmp"(%243, %246) <{"predicate" = 8 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%247, %239) [^248, ^249] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 1>}> : (i1, i64) -> ()
      ^248():
        %251 = "llvm.sub"(%243, %246) : (i64, i64) -> i64
        %252 = "llvm.icmp"(%251, %189) <{"predicate" = 8 : i64}> : (i64, i64) -> i1
        %254 = "llvm.select"(%252, %20, %8) : (i1, i32, i32) -> i32
        %255 = "llvm.sext"(%254) : (i32) -> i64
        %256 = "llvm.sub"(%239, %255) : (i64, i64) -> i64
        "llvm.br"(%256) [^249] : (i64) -> ()
      ^249(%arg249_0 : i64):
        %258 = "llvm.trunc"(%arg249_0) : (i64) -> i32
        %259 = "llvm.zext"(%231) : (i32) -> i64
        %260 = "llvm.shl"(%259, %9) : (i64, i64) -> i64
        %261 = "llvm.zext"(%258) : (i32) -> i64
        %262 = "llvm.or"(%260, %261) : (i64, i64) -> i64
        %263 = "llvm.icmp"(%28, %21) <{"predicate" = 1 : i64}> : (!llvm.ptr, !llvm.ptr) -> i1
        "llvm.cond_br"(%263) [^264, ^265] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^264():
        %267 = "llvm.mul"(%262, %arg7_0) : (i64, i64) -> i64
        %268 = "llvm.sub"(%17, %267) : (i64, i64) -> i64
        "llvm.store"(%268, %28) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i64, !llvm.ptr) -> ()
        "llvm.br"() [^265] : () -> ()
      ^265():
        "llvm.br"(%262) [^120] : (i64) -> ()
      ^120(%arg120_0 : i64):
        %272 = "llvm.load"(%28) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i64
        %273 = "llvm.sub"(%arg7_0, %272) : (i64, i64) -> i64
        %274 = "llvm.icmp"(%arg7_1, %11) <{"predicate" = 1 : i64}> : (i32, i32) -> i1
        "llvm.cond_br"(%274) [^275, ^276] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^276():
        %278 = "llvm.zext"(%95) : (i32) -> i64
        %279 = "llvm.shl"(%16, %278) : (i64, i64) -> i64
        %280 = "llvm.icmp"(%273, %279) <{"predicate" = 6 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%280) [^281, ^275] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^281():
        %283 = "llvm.trunc"(%95) : (i32) -> i8
        "llvm.br"(%arg120_0, %283) [^284] : (i64, i8) -> ()
      ^275():
        %286 = "llvm.add"(%arg120_0, %arg120_0) : (i64, i64) -> i64
        %287 = "llvm.load"(%28) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i64
        %288 = "llvm.load"(%28) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i64
        %289 = "llvm.add"(%287, %288) : (i64, i64) -> i64
        %290 = "llvm.icmp"(%289, %arg7_0) <{"predicate" = 9 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%290) [^291, ^292] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^292():
        %294 = "llvm.load"(%28) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (!llvm.ptr) -> i64
        %295 = "llvm.icmp"(%289, %294) <{"predicate" = 6 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%295, %286) [^291, ^296] <{"branch_weights" = array<i32>, "operandSegmentSizes" = array<i32: 1, 0, 1>}> : (i1, i64) -> ()
      ^291():
        %298 = "llvm.add"(%286, %16) : (i64, i64) -> i64
        "llvm.br"(%298) [^296] : (i64) -> ()
      ^296(%arg296_0 : i64):
        %300 = "llvm.or"(%95, %23) : (i32, i32) -> i32
        %301 = "llvm.trunc"(%300) : (i32) -> i8
        "llvm.br"(%arg296_0, %301) [^284] : (i64, i8) -> ()
      ^284(%arg284_0 : i64, %arg284_1 : i8):
        %303 = "llvm.add"(%16, %arg284_0) : (i64, i64) -> i64
        "llvm.br"(%arg284_1, %303) [^106] : (i8, i64) -> ()
      ^106(%arg106_0 : i8, %arg106_1 : i64):
        "llvm.store"(%arg106_1, %arg7_2) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i64, !llvm.ptr) -> ()
        %306 = "llvm.getelementptr"(%arg7_2, %24) <{"elem_type" = i8, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.store"(%arg106_0, %306) <{"access_groups" = [], "alias_scopes" = [], "alignment" = 8 : i64, "noalias_scopes" = [], "tbaa" = []}> : (i8, !llvm.ptr) -> ()
        %308 = "llvm.getelementptr"(%arg7_2, %25) <{"elem_type" = i8, "noWrapFlags" = 3 : i32, "rawConstantIndices" = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.intr.memcpy"(%308, %27, %26) <{"arg_attrs" = [{"llvm.align" = 1 : i64}, {"llvm.align" = 1 : i64}, {}], "isVolatile" = 0 : i1}> : (!llvm.ptr, !llvm.ptr, i64) -> ()
        "llvm.return"() : () -> ()
    }) : () -> ()
}) {"dlti.dl_spec" = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, "llvm.ident" = "Ubuntu clang version 18.1.3 (1ubuntu1)", "llvm.module_asm" = [], "llvm.target_triple" = "x86_64-pc-linux-gnu"} : () -> ()
