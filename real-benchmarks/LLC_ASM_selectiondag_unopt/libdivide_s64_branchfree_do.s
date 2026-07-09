	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	libdivide_s64_branchfree_do     # -- Begin function libdivide_s64_branchfree_do
	.p2align	2
	.type	libdivide_s64_branchfree_do,@function
libdivide_s64_branchfree_do:            # @libdivide_s64_branchfree_do
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
	ld	a3, 0(a1)
	lbu	a1, 8(a1)
	zext.w	a4, a0
	zext.w	a5, a3
	srai	a6, a0, 32
	mul	a7, a5, a4
	srai	t0, a3, 32
	mul	a5, a5, a6
	mul	a4, t0, a4
	mul	a6, t0, a6
	li	t0, 1
	srli	a7, a7, 32
	add	a5, a7, a5
	zext.b	a7, a1
	add	a0, a6, a0
	add.uw	a4, a5, a4
	srai	a5, a5, 32
	srai	a4, a4, 32
	add	a0, a0, a5
	czero.nez	a3, t0, a3
	add	a0, a0, a4
	neg	a3, a3
	bset	a4, zero, a7
	srli	a5, a0, 63
	add	a3, a4, a3
	zext.h	a4, a5
	slli	a1, a1, 56
	czero.eqz	a3, a3, a4
	srai	a1, a1, 63
	add	a0, a3, a0
	sext.b	a1, a1
	sra	a0, a0, a7
	xor	a0, a0, a1
	sub	a0, a0, a1
	sd	a0, 0(a2)
	.cfi_def_cfa sp, 16
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	libdivide_s64_branchfree_do, .Lfunc_end0-libdivide_s64_branchfree_do
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
