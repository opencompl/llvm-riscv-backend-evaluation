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
	neg	a3, a0
	max	a3, a0, a3
	srli	a6, a3, 32
	li	a4, 1
	czero.nez	a5, a4, a6
	bnez	a5, .LBB0_4
# %bb.1:                                # %.preheader27
	lui	a4, 4096
	sltu	a4, a6, a4
	xori	a4, a4, 1
	zext.h	a4, a4
	bnez	a4, .LBB0_8
# %bb.2:                                # %.lr.ph.preheader
	lui	a5, 1044480
	li	a4, 8
	li	a7, 1
.LBB0_3:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	srliw	a5, a5, 8
	and	t0, a5, a6
	czero.nez	t0, a7, t0
	addi	a4, a4, 8
	bnez	t0, .LBB0_3
	j	.LBB0_9
.LBB0_4:
	sext.w	a5, a3
	czero.nez	a4, a4, a5
	bnez	a4, .LBB0_11
# %bb.5:                                # %.preheader24
	lui	a4, 4096
	sltu	a4, a5, a4
	xori	a4, a4, 1
	zext.h	a4, a4
	bnez	a4, .LBB0_12
# %bb.6:                                # %.lr.ph43.preheader
	lui	a5, 1044480
	li	a4, 8
	li	a7, 1
.LBB0_7:                                # %.lr.ph43
                                        # =>This Inner Loop Header: Depth=1
	srliw	a5, a5, 8
	and	t0, a5, a3
	czero.nez	t0, a7, t0
	addi	a4, a4, 8
	bnez	t0, .LBB0_7
	j	.LBB0_13
.LBB0_8:
	li	a4, 8
	lui	a5, 1044480
.LBB0_9:                                # %.preheader25
	and	t0, a5, a6
	li	a7, 1
	czero.nez	t0, a7, t0
	bnez	t0, .LBB0_16
.LBB0_10:                               # %.lr.ph41
                                        # =>This Inner Loop Header: Depth=1
	slliw	a5, a5, 1
	and	t0, a5, a6
	czero.nez	t0, a7, t0
	addi	a4, a4, -1
	beqz	t0, .LBB0_10
	j	.LBB0_16
.LBB0_11:
	li	a4, 32
	j	.LBB0_15
.LBB0_12:
	li	a4, 8
	lui	a5, 1044480
.LBB0_13:                               # %.preheader22
	and	a7, a5, a3
	sext.w	a7, a7
	li	t0, 1
	czero.nez	a7, t0, a7
	bnez	a7, .LBB0_15
.LBB0_14:                               # %.lr.ph47
                                        # =>This Inner Loop Header: Depth=1
	slli	a5, a5, 1
	and	a7, a5, a3
	sext.w	a7, a7
	seqz	a7, a7
	xori	a7, a7, 1
	zext.h	a7, a7
	addi	a4, a4, -1
	bnez	a7, .LBB0_14
.LBB0_15:                               # %.loopexit23
	addi	a4, a4, 32
.LBB0_16:                               # %.loopexit26
	cpop	a5, a3
	sltiu	a5, a5, 2
	xori	a5, a5, 1
	li	a7, 63
	zext.h	t0, a5
	sub	a5, a7, a4
	bnez	t0, .LBB0_18
# %bb.17:
	li	a3, 0
	srli	a0, a0, 63
	slli	a0, a0, 63
	srai	a0, a0, 63
	andi	a4, a0, 128
	or	a4, a5, a4
	j	.LBB0_46
.LBB0_18:
	li	a7, 62
	sub	a4, a7, a4
	bset	a7, zero, a4
	sltu	t0, a7, a3
	xori	t0, t0, 1
	zext.h	t0, t0
	bnez	t0, .LBB0_23
# %bb.19:
	li	t0, 1
	czero.nez	t1, t0, a6
	bnez	t1, .LBB0_24
# %bb.20:                               # %.preheader21
	lui	t0, 4096
	sltu	t0, a6, t0
	xori	t0, t0, 1
	zext.h	t0, t0
	bnez	t0, .LBB0_28
# %bb.21:                               # %.lr.ph49.preheader
	lui	t1, 1044480
	li	t0, 8
	li	t2, 1
.LBB0_22:                               # %.lr.ph49
                                        # =>This Inner Loop Header: Depth=1
	srliw	t1, t1, 8
	and	t3, t1, a6
	czero.nez	t3, t2, t3
	addi	t0, t0, 8
	bnez	t3, .LBB0_22
	j	.LBB0_29
.LBB0_23:
	li	a7, -1
	li	a6, -1
	j	.LBB0_41
.LBB0_24:
	sext.w	a6, a3
	czero.nez	t0, t0, a6
	bnez	t0, .LBB0_31
# %bb.25:                               # %.preheader18
	lui	t0, 4096
	sltu	a6, a6, t0
	xori	a6, a6, 1
	zext.h	a6, a6
	bnez	a6, .LBB0_32
# %bb.26:                               # %.lr.ph55.preheader
	lui	t0, 1044480
	li	a6, 8
	li	t1, 1
.LBB0_27:                               # %.lr.ph55
                                        # =>This Inner Loop Header: Depth=1
	srliw	t0, t0, 8
	and	t2, t0, a3
	czero.nez	t2, t1, t2
	addi	a6, a6, 8
	bnez	t2, .LBB0_27
	j	.LBB0_33
.LBB0_28:
	li	t0, 8
	lui	t1, 1044480
.LBB0_29:                               # %.preheader19
	and	t3, t1, a6
	li	t2, 1
	czero.nez	t3, t2, t3
	bnez	t3, .LBB0_36
.LBB0_30:                               # %.lr.ph53
                                        # =>This Inner Loop Header: Depth=1
	slliw	t1, t1, 1
	and	t3, t1, a6
	czero.nez	t3, t2, t3
	addi	t0, t0, -1
	beqz	t3, .LBB0_30
	j	.LBB0_36
.LBB0_31:
	li	a6, 32
	j	.LBB0_35
.LBB0_32:
	li	a6, 8
	lui	t0, 1044480
.LBB0_33:                               # %.preheader
	and	t1, t0, a3
	sext.w	t1, t1
	li	t2, 1
	czero.nez	t1, t2, t1
	bnez	t1, .LBB0_35
.LBB0_34:                               # %.lr.ph59
                                        # =>This Inner Loop Header: Depth=1
	slli	t0, t0, 1
	and	t1, t0, a3
	sext.w	t1, t1
	seqz	t1, t1
	xori	t1, t1, 1
	zext.h	t1, t1
	addi	a6, a6, -1
	bnez	t1, .LBB0_34
.LBB0_35:                               # %.loopexit
	addi	t0, a6, 32
.LBB0_36:                               # %.loopexit20
	sll	a6, a3, t0
	sll	t0, a7, t0
	srli	a7, a6, 32
	divu	t2, t0, a7
	mul	t4, t2, a7
	zext.w	t1, a6
	mul	t3, t1, t2
	sub	t4, t0, t4
	slli	t4, t4, 32
	sltu	t5, t4, t3
	xori	t5, t5, 1
	zext.h	t5, t5
	bnez	t5, .LBB0_38
# %bb.37:
	sub	t3, t3, t4
	sltu	t3, a6, t3
	zext.h	t3, t3
	li	t4, 1
	czero.nez	t3, t4, t3
	li	t4, -2
	add.uw	t3, t4, t3
	add	t2, t3, t2
.LBB0_38:
	zext.w	t2, t2
	mul	t3, a6, t2
	slli	t0, t0, 32
	sub	t3, t0, t3
	divu	t0, t3, a7
	mul	t4, t0, a7
	mul	a7, t0, t1
	sub	t1, t3, t4
	slli	t1, t1, 32
	sltu	t3, t1, a7
	xori	t3, t3, 1
	zext.h	t3, t3
	bnez	t3, .LBB0_40
# %bb.39:
	sub	a7, a7, t1
	sltu	a6, a6, a7
	zext.h	a6, a6
	li	a7, 1
	czero.nez	a6, a7, a6
	li	a7, -2
	add.uw	a6, a7, a6
	add	t0, a6, t0
.LBB0_40:
	pack	a6, t0, t2
	mul	a7, a3, a6
	neg	a7, a7
.LBB0_41:
	sext.w	a1, a1
	seqz	t0, a1
	xori	t0, t0, 1
	zext.h	t0, t0
	bnez	t0, .LBB0_43
# %bb.42:
	sub	t0, a3, a7
	srl	t0, t0, a5
	seqz	t0, t0
	xori	t0, t0, 1
	zext.h	t0, t0
	beqz	t0, .LBB0_44
.LBB0_43:
	slli	a4, a7, 1
	sltu	a3, a4, a3
	xori	a3, a3, 1
	srli	a4, a7, 63
	or	a3, a4, a3
	zext.h	a3, a3
	sh1add	a6, a6, a3
	ori	a4, a5, 64
.LBB0_44:
	srli	a0, a0, 63
	xori	a0, a0, 1
	zext.h	a0, a0
	addi	a3, a6, 1
	bnez	a0, .LBB0_46
# %bb.45:
	li	a0, 1
	czero.nez	a0, a0, a1
	not	a1, a6
	czero.nez	a3, a3, a0
	czero.eqz	a0, a1, a0
	ori	a4, a4, -128
	or	a3, a0, a3
.LBB0_46:
	sd	a3, 0(a2)
	sb	a4, 8(a2)
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
