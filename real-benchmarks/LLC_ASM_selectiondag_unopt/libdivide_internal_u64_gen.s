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
	srli	a5, a0, 32
	li	a3, 1
	czero.nez	a4, a3, a5
	bnez	a4, .LBB0_4
# %bb.1:                                # %.preheader30
	lui	a3, 4096
	sltu	a3, a5, a3
	xori	a3, a3, 1
	zext.h	a3, a3
	bnez	a3, .LBB0_8
# %bb.2:                                # %.lr.ph.preheader
	lui	a4, 1044480
	li	a3, 8
	li	a6, 1
.LBB0_3:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	srliw	a4, a4, 8
	and	a7, a4, a5
	czero.nez	a7, a6, a7
	addi	a3, a3, 8
	bnez	a7, .LBB0_3
	j	.LBB0_9
.LBB0_4:
	sext.w	a4, a0
	czero.nez	a3, a3, a4
	bnez	a3, .LBB0_11
# %bb.5:                                # %.preheader27
	lui	a3, 4096
	sltu	a3, a4, a3
	xori	a3, a3, 1
	zext.h	a3, a3
	bnez	a3, .LBB0_12
# %bb.6:                                # %.lr.ph46.preheader
	lui	a4, 1044480
	li	a3, 8
	li	a6, 1
.LBB0_7:                                # %.lr.ph46
                                        # =>This Inner Loop Header: Depth=1
	srliw	a4, a4, 8
	and	a7, a4, a0
	czero.nez	a7, a6, a7
	addi	a3, a3, 8
	bnez	a7, .LBB0_7
	j	.LBB0_13
.LBB0_8:
	li	a3, 8
	lui	a4, 1044480
.LBB0_9:                                # %.preheader28
	and	a7, a4, a5
	li	a6, 1
	czero.nez	a7, a6, a7
	bnez	a7, .LBB0_16
.LBB0_10:                               # %.lr.ph44
                                        # =>This Inner Loop Header: Depth=1
	slliw	a4, a4, 1
	and	a7, a4, a5
	czero.nez	a7, a6, a7
	addi	a3, a3, -1
	beqz	a7, .LBB0_10
	j	.LBB0_16
.LBB0_11:
	li	a3, 32
	j	.LBB0_15
.LBB0_12:
	li	a3, 8
	lui	a4, 1044480
.LBB0_13:                               # %.preheader25
	and	a6, a4, a0
	sext.w	a6, a6
	li	a7, 1
	czero.nez	a6, a7, a6
	bnez	a6, .LBB0_15
.LBB0_14:                               # %.lr.ph50
                                        # =>This Inner Loop Header: Depth=1
	slli	a4, a4, 1
	and	a6, a4, a0
	sext.w	a6, a6
	seqz	a6, a6
	xori	a6, a6, 1
	zext.h	a6, a6
	addi	a3, a3, -1
	bnez	a6, .LBB0_14
.LBB0_15:                               # %.loopexit26
	addi	a3, a3, 32
.LBB0_16:                               # %.loopexit29
	cpop	a4, a0
	sltiu	a4, a4, 2
	xori	a4, a4, 1
	li	a6, 63
	zext.h	a4, a4
	sub	a3, a6, a3
	bnez	a4, .LBB0_18
# %bb.17:
	li	a5, 0
	sext.w	a1, a1
	li	a0, 1
	czero.eqz	a0, a0, a1
	neg	a0, a0
	add	a3, a3, a0
	j	.LBB0_45
.LBB0_18:
	bset	a4, zero, a3
	sltu	a6, a4, a0
	xori	a6, a6, 1
	zext.h	a6, a6
	bnez	a6, .LBB0_23
# %bb.19:
	li	a6, 1
	czero.nez	a7, a6, a5
	bnez	a7, .LBB0_24
# %bb.20:                               # %.preheader24
	lui	a6, 4096
	sltu	a6, a5, a6
	xori	a6, a6, 1
	zext.h	a6, a6
	bnez	a6, .LBB0_28
# %bb.21:                               # %.lr.ph52.preheader
	lui	a7, 1044480
	li	a6, 8
	li	t0, 1
.LBB0_22:                               # %.lr.ph52
                                        # =>This Inner Loop Header: Depth=1
	srliw	a7, a7, 8
	and	t1, a7, a5
	czero.nez	t1, t0, t1
	addi	a6, a6, 8
	bnez	t1, .LBB0_22
	j	.LBB0_29
.LBB0_23:
	li	a6, -1
	li	a5, -1
	j	.LBB0_41
.LBB0_24:
	sext.w	a5, a0
	czero.nez	a6, a6, a5
	bnez	a6, .LBB0_31
# %bb.25:                               # %.preheader21
	lui	a6, 4096
	sltu	a5, a5, a6
	xori	a5, a5, 1
	zext.h	a5, a5
	bnez	a5, .LBB0_32
# %bb.26:                               # %.lr.ph58.preheader
	lui	a6, 1044480
	li	a5, 8
	li	a7, 1
.LBB0_27:                               # %.lr.ph58
                                        # =>This Inner Loop Header: Depth=1
	srliw	a6, a6, 8
	and	t0, a6, a0
	czero.nez	t0, a7, t0
	addi	a5, a5, 8
	bnez	t0, .LBB0_27
	j	.LBB0_33
.LBB0_28:
	li	a6, 8
	lui	a7, 1044480
.LBB0_29:                               # %.preheader22
	and	t1, a7, a5
	li	t0, 1
	czero.nez	t1, t0, t1
	bnez	t1, .LBB0_36
.LBB0_30:                               # %.lr.ph56
                                        # =>This Inner Loop Header: Depth=1
	slliw	a7, a7, 1
	and	t1, a7, a5
	czero.nez	t1, t0, t1
	addi	a6, a6, -1
	beqz	t1, .LBB0_30
	j	.LBB0_36
.LBB0_31:
	li	a5, 32
	j	.LBB0_35
.LBB0_32:
	li	a5, 8
	lui	a6, 1044480
.LBB0_33:                               # %.preheader
	and	a7, a6, a0
	sext.w	a7, a7
	li	t0, 1
	czero.nez	a7, t0, a7
	bnez	a7, .LBB0_35
.LBB0_34:                               # %.lr.ph62
                                        # =>This Inner Loop Header: Depth=1
	slli	a6, a6, 1
	and	a7, a6, a0
	sext.w	a7, a7
	seqz	a7, a7
	xori	a7, a7, 1
	zext.h	a7, a7
	addi	a5, a5, -1
	bnez	a7, .LBB0_34
.LBB0_35:                               # %.loopexit
	addi	a6, a5, 32
.LBB0_36:                               # %.loopexit23
	sll	a5, a0, a6
	sll	a7, a4, a6
	srli	a6, a5, 32
	divu	t1, a7, a6
	mul	t3, t1, a6
	zext.w	t0, a5
	mul	t2, t0, t1
	sub	t3, a7, t3
	slli	t3, t3, 32
	sltu	t4, t3, t2
	xori	t4, t4, 1
	zext.h	t4, t4
	bnez	t4, .LBB0_38
# %bb.37:
	sub	t2, t2, t3
	sltu	t2, a5, t2
	zext.h	t2, t2
	li	t3, 1
	czero.nez	t2, t3, t2
	li	t3, -2
	add.uw	t2, t3, t2
	add	t1, t2, t1
.LBB0_38:
	zext.w	t1, t1
	mul	t2, a5, t1
	slli	a7, a7, 32
	sub	t2, a7, t2
	divu	a7, t2, a6
	mul	t3, a7, a6
	mul	a6, a7, t0
	sub	t0, t2, t3
	slli	t0, t0, 32
	sltu	t2, t0, a6
	xori	t2, t2, 1
	zext.h	t2, t2
	bnez	t2, .LBB0_40
# %bb.39:
	sub	a6, a6, t0
	sltu	a5, a5, a6
	zext.h	a5, a5
	li	a6, 1
	czero.nez	a5, a6, a5
	li	a6, -2
	add.uw	a5, a6, a5
	add	a7, a5, a7
.LBB0_40:
	pack	a5, a7, t1
	mul	a6, a0, a5
	neg	a6, a6
.LBB0_41:
	sext.w	a1, a1
	seqz	a1, a1
	xori	a1, a1, 1
	zext.h	a1, a1
	bnez	a1, .LBB0_43
# %bb.42:
	sub	a1, a0, a6
	sltu	a1, a1, a4
	xori	a1, a1, 1
	zext.h	a1, a1
	beqz	a1, .LBB0_44
.LBB0_43:
	slli	a1, a6, 1
	sltu	a0, a1, a0
	xori	a0, a0, 1
	srli	a1, a6, 63
	or	a0, a1, a0
	zext.h	a0, a0
	sh1add	a5, a5, a0
	ori	a3, a3, 64
.LBB0_44:
	addi	a5, a5, 1
.LBB0_45:
	sd	a5, 0(a2)
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
