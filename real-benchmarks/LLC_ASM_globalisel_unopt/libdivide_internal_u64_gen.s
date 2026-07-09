	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	libdivide_internal_u64_gen      # -- Begin function libdivide_internal_u64_gen
	.p2align	2
	.type	libdivide_internal_u64_gen,@function
libdivide_internal_u64_gen:             # @libdivide_internal_u64_gen
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
	lui	t1, 4096
	li	a4, 8
	li	t0, 32
	li	a3, 63
	srli	a7, a0, 32
	li	a6, 2
	lui	a5, 1044480
	beqz	a7, .LBB0_6
# %bb.1:                                # %.preheader30
	sext.w	t4, a7
	lui	t3, 1044480
	li	t2, 8
	bgeu	t4, t1, .LBB0_4
# %bb.2:
	li	t2, 8
.LBB0_3:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	zext.w	t3, t3
	srli	t3, t3, 8
	and	t4, t3, a7
	addi	t2, t2, 8
	beqz	t4, .LBB0_3
.LBB0_4:                                # %.preheader28
	and	t4, t3, a7
	sext.w	t4, t4
	beqz	t4, .LBB0_13
.LBB0_5:                                # %.lr.ph44
                                        # =>This Inner Loop Header: Depth=1
	slli	t3, t3, 1
	and	t4, t3, a7
	sext.w	t4, t4
	addi	t2, t2, -1
	bnez	t4, .LBB0_5
	j	.LBB0_13
.LBB0_6:
	sext.w	t4, a0
	li	t2, 32
	beqz	t4, .LBB0_12
# %bb.7:                                # %.preheader27
	lui	t3, 1044480
	li	t2, 8
	bgeu	t4, t1, .LBB0_10
# %bb.8:
	li	t2, 8
.LBB0_9:                                # %.lr.ph46
                                        # =>This Inner Loop Header: Depth=1
	zext.w	t3, t3
	srli	t3, t3, 8
	and	t4, t3, a0
	addi	t2, t2, 8
	beqz	t4, .LBB0_9
.LBB0_10:                               # %.preheader25
	and	t4, t3, a0
	sext.w	t4, t4
	beqz	t4, .LBB0_12
.LBB0_11:                               # %.lr.ph50
                                        # =>This Inner Loop Header: Depth=1
	slli	t3, t3, 1
	and	t4, t3, a0
	sext.w	t4, t4
	addi	t2, t2, -1
	bnez	t4, .LBB0_11
.LBB0_12:                               # %.loopexit26
	addi	t2, t2, 32
.LBB0_13:                               # %.loopexit29
	cpop	t3, a0
	sub	a3, a3, t2
	bgeu	t3, a6, .LBB0_15
# %bb.14:
	li	a4, 0
	sext.w	a1, a1
	snez	a0, a1
	slli	a0, a0, 63
	srai	a0, a0, 63
	add	a3, a3, a0
	j	.LBB0_36
.LBB0_15:
	bset	a6, zero, a3
	bgeu	a6, a0, .LBB0_21
# %bb.16:
	beqz	a7, .LBB0_22
# %bb.17:                               # %.preheader24
	sext.w	t0, a7
	bgeu	t0, t1, .LBB0_19
.LBB0_18:                               # %.lr.ph52
                                        # =>This Inner Loop Header: Depth=1
	zext.w	a5, a5
	srli	a5, a5, 8
	and	t0, a5, a7
	addi	a4, a4, 8
	beqz	t0, .LBB0_18
.LBB0_19:                               # %.preheader22
	and	t0, a5, a7
	sext.w	t0, t0
	beqz	t0, .LBB0_28
.LBB0_20:                               # %.lr.ph56
                                        # =>This Inner Loop Header: Depth=1
	slli	a5, a5, 1
	and	t0, a5, a7
	sext.w	t0, t0
	addi	a4, a4, -1
	bnez	t0, .LBB0_20
	j	.LBB0_28
.LBB0_21:
	li	a5, -1
	li	a4, -1
	sext.w	a1, a1
	beqz	a1, .LBB0_33
	j	.LBB0_34
.LBB0_22:
	sext.w	a7, a0
	beqz	a7, .LBB0_27
# %bb.23:                               # %.preheader21
	bgeu	a7, t1, .LBB0_25
.LBB0_24:                               # %.lr.ph58
                                        # =>This Inner Loop Header: Depth=1
	zext.w	a5, a5
	srli	a5, a5, 8
	and	a7, a5, a0
	addi	a4, a4, 8
	beqz	a7, .LBB0_24
.LBB0_25:                               # %.preheader
	and	a7, a5, a0
	mv	t0, a4
	sext.w	a7, a7
	beqz	a7, .LBB0_27
.LBB0_26:                               # %.lr.ph62
                                        # =>This Inner Loop Header: Depth=1
	slli	a5, a5, 1
	and	a4, a5, a0
	sext.w	a4, a4
	addi	t0, t0, -1
	bnez	a4, .LBB0_26
.LBB0_27:                               # %.loopexit
	addi	a4, t0, 32
.LBB0_28:                               # %.loopexit23
	sll	a5, a0, a4
	sll	a7, a6, a4
	srli	a4, a5, 32
	divu	t1, a7, a4
	mul	t3, t1, a4
	zext.w	t0, a5
	mul	t2, t0, t1
	sub	t3, a7, t3
	slli	t3, t3, 32
	bgeu	t3, t2, .LBB0_30
# %bb.29:
	sub	t2, t2, t3
	sltu	t2, a5, t2
	slli	t2, t2, 63
	srai	t2, t2, 63
	add	t1, t2, t1
	addi	t1, t1, -1
.LBB0_30:
	zext.w	t1, t1
	mul	t2, a5, t1
	slli	a7, a7, 32
	sub	t2, a7, t2
	divu	a7, t2, a4
	mul	t3, a7, a4
	mul	a4, a7, t0
	sub	t0, t2, t3
	slli	t0, t0, 32
	bgeu	t0, a4, .LBB0_32
# %bb.31:
	sub	a4, a4, t0
	sltu	a4, a5, a4
	slli	a4, a4, 63
	srai	a4, a4, 63
	add	a4, a4, a7
	addi	a7, a4, -1
.LBB0_32:
	pack	a4, a7, t1
	mul	a5, a0, a4
	neg	a5, a5
	sext.w	a1, a1
	bnez	a1, .LBB0_34
.LBB0_33:
	sub	a1, a0, a5
	bltu	a1, a6, .LBB0_35
.LBB0_34:
	slli	a4, a4, 1
	slli	a1, a5, 1
	sltu	a0, a1, a0
	srli	a5, a5, 63
	xori	a0, a0, 1
	or	a4, a4, a5
	or	a4, a4, a0
	ori	a3, a3, 64
.LBB0_35:
	addi	a4, a4, 1
.LBB0_36:
	sd	a4, 0(a2)
	sb	a3, 8(a2)
	.cfi_def_cfa sp, 16
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	libdivide_internal_u64_gen, .Lfunc_end0-libdivide_internal_u64_gen
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
