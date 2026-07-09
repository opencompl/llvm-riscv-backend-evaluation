	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	libdivide_internal_s64_gen      # -- Begin function libdivide_internal_s64_gen
	.p2align	2
	.type	libdivide_internal_s64_gen,@function
libdivide_internal_s64_gen:             # @libdivide_internal_s64_gen
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	sd	s0, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	lui	t2, 4096
	li	a4, 8
	neg	a3, a0
	li	t1, 32
	max	a3, a0, a3
	li	a5, 63
	srli	t0, a3, 32
	li	t3, 2
	lui	a6, 1044480
	beqz	t0, .LBB0_6
# %bb.1:                                # %.preheader27
	sext.w	t5, t0
	lui	a7, 1044480
	li	t4, 8
	bgeu	t5, t2, .LBB0_4
# %bb.2:
	li	t4, 8
.LBB0_3:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	zext.w	a7, a7
	srli	a7, a7, 8
	and	t5, a7, t0
	addi	t4, t4, 8
	beqz	t5, .LBB0_3
.LBB0_4:                                # %.preheader25
	and	t5, a7, t0
	sext.w	t5, t5
	beqz	t5, .LBB0_13
.LBB0_5:                                # %.lr.ph41
                                        # =>This Inner Loop Header: Depth=1
	slli	a7, a7, 1
	and	t5, a7, t0
	sext.w	t5, t5
	addi	t4, t4, -1
	bnez	t5, .LBB0_5
	j	.LBB0_13
.LBB0_6:
	sext.w	t5, a3
	li	a7, 32
	beqz	t5, .LBB0_12
# %bb.7:                                # %.preheader24
	lui	t4, 1044480
	li	a7, 8
	bgeu	t5, t2, .LBB0_10
# %bb.8:
	li	a7, 8
.LBB0_9:                                # %.lr.ph43
                                        # =>This Inner Loop Header: Depth=1
	zext.w	t4, t4
	srli	t4, t4, 8
	and	t5, t4, a3
	addi	a7, a7, 8
	beqz	t5, .LBB0_9
.LBB0_10:                               # %.preheader22
	and	t5, t4, a3
	sext.w	t5, t5
	beqz	t5, .LBB0_12
.LBB0_11:                               # %.lr.ph47
                                        # =>This Inner Loop Header: Depth=1
	slli	t4, t4, 1
	and	t5, t4, a3
	sext.w	t5, t5
	addi	a7, a7, -1
	bnez	t5, .LBB0_11
.LBB0_12:                               # %.loopexit23
	addi	t4, a7, 32
.LBB0_13:                               # %.loopexit26
	cpop	t5, a3
	sub	a7, a5, t4
	bgeu	t5, t3, .LBB0_15
# %bb.14:
	li	a3, 0
	srli	a0, a0, 63
	slli	a0, a0, 7
	or	a5, a7, a0
	j	.LBB0_39
.LBB0_15:
	li	a5, 62
	sub	a5, a5, t4
	bset	t3, zero, a5
	bgeu	t3, a3, .LBB0_21
# %bb.16:
	beqz	t0, .LBB0_22
# %bb.17:                               # %.preheader21
	sext.w	t1, t0
	bgeu	t1, t2, .LBB0_19
.LBB0_18:                               # %.lr.ph49
                                        # =>This Inner Loop Header: Depth=1
	zext.w	a6, a6
	srli	a6, a6, 8
	and	t1, a6, t0
	addi	a4, a4, 8
	beqz	t1, .LBB0_18
.LBB0_19:                               # %.preheader19
	and	t1, a6, t0
	sext.w	t1, t1
	beqz	t1, .LBB0_28
.LBB0_20:                               # %.lr.ph53
                                        # =>This Inner Loop Header: Depth=1
	slli	a6, a6, 1
	and	t1, a6, t0
	sext.w	t1, t1
	addi	a4, a4, -1
	bnez	t1, .LBB0_20
	j	.LBB0_28
.LBB0_21:
	li	a6, -1
	li	a4, -1
	sext.w	a1, a1
	bnez	a1, .LBB0_34
	j	.LBB0_33
.LBB0_22:
	sext.w	t0, a3
	beqz	t0, .LBB0_27
# %bb.23:                               # %.preheader18
	bgeu	t0, t2, .LBB0_25
.LBB0_24:                               # %.lr.ph55
                                        # =>This Inner Loop Header: Depth=1
	zext.w	a6, a6
	srli	a6, a6, 8
	and	t0, a6, a3
	addi	a4, a4, 8
	beqz	t0, .LBB0_24
.LBB0_25:                               # %.preheader
	and	t0, a6, a3
	mv	t1, a4
	sext.w	t0, t0
	beqz	t0, .LBB0_27
.LBB0_26:                               # %.lr.ph59
                                        # =>This Inner Loop Header: Depth=1
	slli	a6, a6, 1
	and	a4, a6, a3
	sext.w	a4, a4
	addi	t1, t1, -1
	bnez	a4, .LBB0_26
.LBB0_27:                               # %.loopexit
	addi	a4, t1, 32
.LBB0_28:                               # %.loopexit20
	sll	a6, a3, a4
	sll	t0, t3, a4
	srli	a4, a6, 32
	divu	t2, t0, a4
	mul	t4, t2, a4
	zext.w	t1, a6
	mul	t3, t1, t2
	sub	t4, t0, t4
	slli	t4, t4, 32
	bgeu	t4, t3, .LBB0_30
# %bb.29:
	sub	t3, t3, t4
	sltu	t3, a6, t3
	slli	t3, t3, 63
	srai	t3, t3, 63
	add	t2, t3, t2
	addi	t2, t2, -1
.LBB0_30:
	zext.w	t2, t2
	mul	t3, a6, t2
	slli	t0, t0, 32
	sub	t3, t0, t3
	divu	t0, t3, a4
	mul	t4, t0, a4
	mul	a4, t0, t1
	sub	t1, t3, t4
	slli	t1, t1, 32
	bgeu	t1, a4, .LBB0_32
# %bb.31:
	sub	a4, a4, t1
	sltu	a4, a6, a4
	slli	a4, a4, 63
	srai	a4, a4, 63
	add	a4, a4, t0
	addi	t0, a4, -1
.LBB0_32:
	pack	a4, t0, t2
	mul	a6, a3, a4
	neg	a6, a6
	sext.w	a1, a1
	bnez	a1, .LBB0_34
.LBB0_33:
	sub	t0, a3, a6
	srl	t0, t0, a7
	beqz	t0, .LBB0_35
.LBB0_34:
	slli	a4, a4, 1
	slli	a5, a6, 1
	sltu	a3, a5, a3
	srli	a5, a6, 63
	xori	a3, a3, 1
	or	a4, a4, a5
	or	a4, a4, a3
	ori	a5, a7, 64
.LBB0_35:
	addi	a3, a4, 1
	bgez	a0, .LBB0_39
# %bb.36:
	bnez	a1, .LBB0_38
# %bb.37:
	not	a3, a4
.LBB0_38:
	ori	a5, a5, -128
.LBB0_39:
	sd	a3, 0(a2)
	sb	a5, 8(a2)
	.cfi_def_cfa sp, 16
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	libdivide_internal_s64_gen, .Lfunc_end0-libdivide_internal_s64_gen
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
