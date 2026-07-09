	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	libdivide_s64_recover           # -- Begin function libdivide_s64_recover
	.p2align	2
	.type	libdivide_s64_recover,@function
libdivide_s64_recover:                  # @libdivide_s64_recover
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
	ld	a2, 0(a0)
	lbu	a0, 8(a0)
	seqz	a3, a2
	xori	a3, a3, 1
	zext.b	a0, a0
	zext.h	a4, a3
	andi	a3, a0, 63
	beqz	a4, .LBB0_7
# %bb.1:
	andi	a4, a0, 64
	li	a5, 1
	srli	a6, a2, 63
	czero.nez	a4, a5, a4
	xori	a5, a6, 1
	slti	a6, a2, 1
	czero.nez	a6, a6, a4
	czero.eqz	a4, a5, a4
	or	a4, a4, a6
	zext.h	a4, a4
	neg	a5, a2
	czero.nez	a5, a5, a4
	czero.eqz	a4, a2, a4
	or	a4, a4, a5
	bset	a3, zero, a3
	sltu	a2, a3, a4
	xori	a2, a2, 1
	zext.h	a5, a2
	li	a2, 0
	bnez	a5, .LBB0_8
# %bb.2:
	clz	a5, a4
	sll	a2, a4, a5
	sll	a4, a3, a5
	srli	a3, a2, 32
	divu	a6, a4, a3
	mul	t0, a6, a3
	zext.w	a5, a2
	mul	a7, a6, a5
	sub	t0, a4, t0
	slli	t0, t0, 32
	sltu	t1, t0, a7
	xori	t1, t1, 1
	zext.h	t1, t1
	bnez	t1, .LBB0_4
# %bb.3:
	sub	a7, a7, t0
	sltu	a7, a2, a7
	zext.h	a7, a7
	li	t0, 1
	czero.nez	a7, t0, a7
	li	t0, -2
	add.uw	a7, t0, a7
	add	a6, a7, a6
.LBB0_4:
	zext.w	a6, a6
	mul	a7, a2, a6
	slli	a4, a4, 32
	sub	a7, a4, a7
	divu	a4, a7, a3
	mul	t0, a4, a3
	mul	a3, a4, a5
	sub	a5, a7, t0
	slli	a5, a5, 32
	sltu	a7, a5, a3
	xori	a7, a7, 1
	zext.h	a7, a7
	bnez	a7, .LBB0_6
# %bb.5:
	sub	a3, a3, a5
	sltu	a2, a2, a3
	zext.h	a2, a2
	li	a3, 1
	czero.nez	a2, a3, a2
	li	a3, -2
	add.uw	a2, a3, a2
	add	a4, a2, a4
.LBB0_6:
	li	a2, 1
	pack	a2, a2, a6
	add.uw	a2, a4, a2
	j	.LBB0_8
.LBB0_7:
	bset	a2, zero, a3
.LBB0_8:
	sext.b	a0, a0
	srli	a0, a0, 63
	neg	a3, a2
	zext.h	a0, a0
	czero.nez	a2, a2, a0
	czero.eqz	a0, a3, a0
	or	a0, a0, a2
	sd	a0, 0(a1)
	.cfi_def_cfa sp, 16
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	libdivide_s64_recover, .Lfunc_end0-libdivide_s64_recover
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
