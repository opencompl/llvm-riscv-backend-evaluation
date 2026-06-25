"builtin.module"() ({
  ^bb4():
    "func.func"() <{"function_type" = () -> (), "sym_name" = "func0"}> ({
      ^bb6(%arg6_0 : !llvm.ptr, %arg6_1 : i64, %arg6_2 : i64, %arg6_3 : !llvm.ptr, %arg6_4 : i64, %arg6_5 : i64):
        %375 = "riscv.lui"() {immediate = 0 : i20} : () -> !riscv.reg
        %373 = "riscv.lui"() {immediate = 2 : i20} : () -> !riscv.reg
        %371 = "riscv.lui"() {immediate = 1 : i20} : () -> !riscv.reg
        %365 = "builtin.unrealized_conversion_cast"(%arg6_4) : (i64) -> !riscv.reg
        %367 = "riscv.xor"(%375, %365) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %368 = "riscv.lui"() {immediate = 0 : i20} : () -> !riscv.reg
        %369 = "riscv.sltu"(%368, %367) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %370 = "builtin.unrealized_conversion_cast"(%369) : (!riscv.reg) -> i1
        %113 = "builtin.unrealized_conversion_cast"(%370) : (i1) -> !riscv.reg
        "riscv_cf.bnez"(%113) [^bb11, ^bb12] <{"operandSegmentSizes" = array<i32: 1, 0, 0>}> : (!riscv.reg) -> ()
      ^bb11():
        %117 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        "riscv_cf.branch"(%117) [^bb14] : (!riscv.reg) -> ()
      ^bb12():
        "riscv_cf.branch"(%373) [^bb14] : (!riscv.reg) -> ()
      ^bb14(%arg14_0 : !riscv.reg):
        %359 = "builtin.unrealized_conversion_cast"(%arg6_4) : (i64) -> !riscv.reg
        %361 = "riscv.xor"(%375, %359) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %362 = "riscv.lui"() {immediate = 0 : i20} : () -> !riscv.reg
        %363 = "riscv.sltu"(%362, %361) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %364 = "builtin.unrealized_conversion_cast"(%363) : (!riscv.reg) -> i1
        %121 = "builtin.unrealized_conversion_cast"(%364) : (i1) -> !riscv.reg
        "riscv_cf.bnez"(%121) [^bb18, ^bb19] <{"operandSegmentSizes" = array<i32: 1, 0, 0>}> : (!riscv.reg) -> ()
      ^bb18():
        "riscv_cf.branch"(%371) [^bb21] : (!riscv.reg) -> ()
      ^bb19():
        %355 = "builtin.unrealized_conversion_cast"(%arg6_5) : (i64) -> !riscv.reg
        %357 = "riscv.div"(%355, %373) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        "riscv_cf.branch"(%357) [^bb21] : (!riscv.reg) -> ()
      ^bb21(%arg21_0 : !riscv.reg):
        %351 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %353 = "riscv.div"(%351, %373) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        "riscv_cf.branch"(%arg14_0, %375, %353, %arg21_0) [^bb26] : (!riscv.reg, !riscv.reg, !riscv.reg, !riscv.reg) -> ()
      ^bb26(%arg26_0 : !riscv.reg, %arg26_1 : !riscv.reg, %arg26_2 : !riscv.reg, %arg26_3 : !riscv.reg):
        %148 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        "riscv_cf.branch"(%148, %375) [^bb28] : (!riscv.reg, !riscv.reg) -> ()
      ^bb28(%arg28_0 : !riscv.reg, %arg28_1 : !riscv.reg):
        %377 = "riscv.slti"(%arg28_1) <{"value" = 1 : i64}> : (!riscv.reg) -> !riscv.reg
        %350 = "builtin.unrealized_conversion_cast"(%377) : (!riscv.reg) -> i1
        %158 = "builtin.unrealized_conversion_cast"(%350) : (i1) -> !riscv.reg
        "riscv_cf.bnez"(%158) [^bb31, ^bb32] <{"operandSegmentSizes" = array<i32: 1, 0, 0>}> : (!riscv.reg) -> ()
      ^bb31():
        %378 = "riscv.srai"(%arg28_1) <{"value" = 1 : i64}> : (!riscv.reg) -> !riscv.reg
        %341 = "riscv.add"(%371, %arg28_0) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        "riscv_cf.branch"(%378, %341) [^bb28] : (!riscv.reg, !riscv.reg) -> ()
      ^bb32():
        %337 = "riscv.slt"(%arg28_0, %arg26_2) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %338 = "builtin.unrealized_conversion_cast"(%337) : (!riscv.reg) -> i1
        %167 = "builtin.unrealized_conversion_cast"(%338) : (i1) -> !riscv.reg
        "riscv_cf.bnez"(%167) [^bb38, ^bb39] <{"operandSegmentSizes" = array<i32: 1, 0, 0>}> : (!riscv.reg) -> ()
      ^bb38():
        "riscv_cf.branch"(%375) [^bb41] : (!riscv.reg) -> ()
      ^bb41(%arg41_0 : !riscv.reg):
        %331 = "builtin.unrealized_conversion_cast"(%arg6_1) : (i64) -> !riscv.reg
        %333 = "riscv.div"(%331, %arg26_3) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %329 = "riscv.slt"(%333, %arg41_0) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %330 = "builtin.unrealized_conversion_cast"(%329) : (!riscv.reg) -> i1
        %175 = "builtin.unrealized_conversion_cast"(%330) : (i1) -> !riscv.reg
        "riscv_cf.bnez"(%175) [^bb45, ^bb46] <{"operandSegmentSizes" = array<i32: 1, 0, 0>}> : (!riscv.reg) -> ()
      ^bb45():
        "riscv_cf.branch"(%375) [^bb48] : (!riscv.reg) -> ()
      ^bb48(%arg48_0 : !riscv.reg):
        %325 = "riscv.div"(%arg26_3, %373) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %321 = "riscv.slt"(%325, %arg48_0) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %322 = "builtin.unrealized_conversion_cast"(%321) : (!riscv.reg) -> i1
        %182 = "builtin.unrealized_conversion_cast"(%322) : (i1) -> !riscv.reg
        "riscv_cf.bnez"(%182) [^bb52, ^bb53] <{"operandSegmentSizes" = array<i32: 1, 0, 0>}> : (!riscv.reg) -> ()
      ^bb52():
        %317 = "riscv.mul"(%arg26_3, %arg41_0) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %313 = "riscv.add"(%arg48_0, %317) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %307 = "builtin.unrealized_conversion_cast"(%arg6_0) : (!llvm.ptr) -> !riscv.reg
        %309 = "riscv.sh3add"(%313, %307) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %310 = "builtin.unrealized_conversion_cast"(%309) : (!riscv.reg) -> !llvm.ptr
        %304 = "builtin.unrealized_conversion_cast"(%310) : (!llvm.ptr) -> !riscv.reg
        %305 = "riscv.ld"(%304) <{"value" = 0 : i64}> : (!riscv.reg) -> !riscv.reg
        %302 = "riscv.div"(%arg26_3, %373) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %298 = "riscv.add"(%302, %313) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %292 = "builtin.unrealized_conversion_cast"(%arg6_0) : (!llvm.ptr) -> !riscv.reg
        %294 = "riscv.sh3add"(%298, %292) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %295 = "builtin.unrealized_conversion_cast"(%294) : (!riscv.reg) -> !llvm.ptr
        %289 = "builtin.unrealized_conversion_cast"(%295) : (!llvm.ptr) -> !riscv.reg
        %290 = "riscv.ld"(%289) <{"value" = 0 : i64}> : (!riscv.reg) -> !riscv.reg
        %287 = "riscv.mul"(%arg48_0, %373) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %283 = "riscv.add"(%371, %287) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %279 = "riscv.mul"(%arg26_1, %283) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %273 = "builtin.unrealized_conversion_cast"(%arg6_3) : (!llvm.ptr) -> !riscv.reg
        %275 = "riscv.sh3add"(%279, %273) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %276 = "builtin.unrealized_conversion_cast"(%275) : (!riscv.reg) -> !llvm.ptr
        %270 = "builtin.unrealized_conversion_cast"(%276) : (!llvm.ptr) -> !riscv.reg
        %271 = "riscv.ld"(%270) <{"value" = 0 : i64}> : (!riscv.reg) -> !riscv.reg
        %268 = "riscv.mul"(%290, %271) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %263 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %264 = "riscv.rem"(%268, %263) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %260 = "riscv.add"(%264, %305) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %255 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %256 = "riscv.rem"(%260, %255) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %252 = "riscv.sub"(%305, %264) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %247 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %248 = "riscv.add"(%247, %252) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %243 = "builtin.unrealized_conversion_cast"(%arg6_2) : (i64) -> !riscv.reg
        %244 = "riscv.rem"(%248, %243) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %238 = "builtin.unrealized_conversion_cast"(%arg6_0) : (!llvm.ptr) -> !riscv.reg
        %240 = "riscv.sh3add"(%313, %238) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %241 = "builtin.unrealized_conversion_cast"(%240) : (!riscv.reg) -> !llvm.ptr
        %235 = "builtin.unrealized_conversion_cast"(%241) : (!llvm.ptr) -> !riscv.reg
        "riscv.sd"(%235, %256) <{"value" = 0 : i64}> : (!riscv.reg, !riscv.reg) -> ()
        %231 = "builtin.unrealized_conversion_cast"(%arg6_0) : (!llvm.ptr) -> !riscv.reg
        %233 = "riscv.sh3add"(%298, %231) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %234 = "builtin.unrealized_conversion_cast"(%233) : (!riscv.reg) -> !llvm.ptr
        %228 = "builtin.unrealized_conversion_cast"(%234) : (!llvm.ptr) -> !riscv.reg
        "riscv.sd"(%228, %244) <{"value" = 0 : i64}> : (!riscv.reg, !riscv.reg) -> ()
        "riscv_cf.branch"() [^bb79] : () -> ()
      ^bb79():
        %226 = "riscv.add"(%371, %arg48_0) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        "riscv_cf.branch"(%226) [^bb48] : (!riscv.reg) -> ()
      ^bb53():
        "riscv_cf.branch"() [^bb83] : () -> ()
      ^bb83():
        %222 = "riscv.add"(%371, %arg41_0) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        "riscv_cf.branch"(%222) [^bb41] : (!riscv.reg) -> ()
      ^bb46():
        %218 = "riscv.div"(%arg26_1, %373) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %210 = "builtin.unrealized_conversion_cast"(%arg6_4) : (i64) -> !riscv.reg
        %212 = "riscv.xor"(%375, %210) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %213 = "riscv.lui"() {immediate = 0 : i20} : () -> !riscv.reg
        %214 = "riscv.sltu"(%213, %212) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %215 = "builtin.unrealized_conversion_cast"(%214) : (!riscv.reg) -> i1
        %129 = "builtin.unrealized_conversion_cast"(%215) : (i1) -> !riscv.reg
        "riscv_cf.bnez"(%129) [^bb89, ^bb90] <{"operandSegmentSizes" = array<i32: 1, 0, 0>}> : (!riscv.reg) -> ()
      ^bb89():
        %208 = "riscv.div"(%arg26_3, %373) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        "riscv_cf.branch"(%208) [^bb93] : (!riscv.reg) -> ()
      ^bb90():
        %204 = "riscv.add"(%arg26_3, %arg26_3) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        "riscv_cf.branch"(%204) [^bb93] : (!riscv.reg) -> ()
      ^bb93(%arg93_0 : !riscv.reg):
        %196 = "builtin.unrealized_conversion_cast"(%arg6_4) : (i64) -> !riscv.reg
        %198 = "riscv.xor"(%375, %196) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %199 = "riscv.lui"() {immediate = 0 : i20} : () -> !riscv.reg
        %200 = "riscv.sltu"(%199, %198) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        %201 = "builtin.unrealized_conversion_cast"(%200) : (!riscv.reg) -> i1
        %160 = "builtin.unrealized_conversion_cast"(%201) : (i1) -> !riscv.reg
        "riscv_cf.bnez"(%160) [^bb98, ^bb99] <{"operandSegmentSizes" = array<i32: 1, 0, 0>}> : (!riscv.reg) -> ()
      ^bb98():
        %194 = "riscv.add"(%arg26_0, %arg26_0) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        "riscv_cf.branch"(%194) [^bb102] : (!riscv.reg) -> ()
      ^bb99():
        %190 = "riscv.div"(%arg26_0, %373) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        "riscv_cf.branch"(%190) [^bb102] : (!riscv.reg) -> ()
      ^bb102(%arg102_0 : !riscv.reg):
        "riscv_cf.branch"() [^bb106] : () -> ()
      ^bb106():
        %186 = "riscv.add"(%371, %arg26_2) : (!riscv.reg, !riscv.reg) -> !riscv.reg
        "riscv_cf.branch"(%arg93_0, %186, %218, %arg102_0) [^bb26] : (!riscv.reg, !riscv.reg, !riscv.reg, !riscv.reg) -> ()
      ^bb39():
        "func.return"() : () -> ()
    }) : () -> ()
}) : () -> ()
