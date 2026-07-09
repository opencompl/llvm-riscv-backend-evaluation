	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	libdivide_s64_do_raw            # -- Begin function libdivide_s64_do_raw
	.p2align	2
	.type	libdivide_s64_do_raw,@function
libdivide_s64_do_raw:                   # @libdivide_s64_do_raw
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
	seqz	a4, a1
	xori	a4, a4, 1
	zext.h	a5, a4
	andi	a4, a2, 63
	beqz	a5, .LBB0_4
# %bb.1:
	zext.w	a5, a0
	zext.w	a6, a1
	srai	a7, a0, 32
	mul	t0, a6, a5
	srai	a1, a1, 32
	mul	a6, a6, a7
	mul	a5, a1, a5
	mul	a1, a1, a7
	srli	a7, t0, 32
	andi	t0, a2, 64
	add	a6, a7, a6
	add.uw	a5, a6, a5
	srai	a6, a6, 32
	li	a7, 1
	add	a1, a6, a1
	srai	a5, a5, 32
	czero.nez	a6, a7, t0
	add	a1, a1, a5
	bnez	a6, .LBB0_3
# %bb.2:
	slli	a2, a2, 56
	srai	a2, a2, 63
	sext.b	a2, a2
	xor	a0, a0, a2
	sub	a2, a2, a1
	sub	a1, a0, a2
.LBB0_3:
	sra	a0, a1, a4
	srli	a1, a0, 63
	add	a0, a1, a0
	j	.LBB0_5
.LBB0_4:
	bset	a1, zero, a4
	srli	a5, a0, 63
	addi	a1, a1, -1
	zext.h	a5, a5
	czero.eqz	a1, a1, a5
	slli	a2, a2, 56
	add	a0, a1, a0
	srai	a2, a2, 63
	sra	a0, a0, a4
	sext.b	a1, a2
	xor	a0, a0, a1
	sub	a0, a0, a1
.LBB0_5:
	sd	a0, 0(a3)
	.cfi_def_cfa sp, 16
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	libdivide_s64_do_raw, .Lfunc_end0-libdivide_s64_do_raw
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
