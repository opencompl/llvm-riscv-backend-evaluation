	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	libdivide_s32_branchfree_do     # -- Begin function libdivide_s32_branchfree_do
	.p2align	2
	.type	libdivide_s32_branchfree_do,@function
libdivide_s32_branchfree_do:            # @libdivide_s32_branchfree_do
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
	lw	a4, 0(a1)
	sext.w	a3, a0
	lbu	a1, 4(a1)
	mul	a3, a4, a3
	srli	a3, a3, 32
	sext.b	a5, a1
	addw	a3, a0, a3
	srai	a0, a5, 7
	bltz	a3, .LBB0_2
# %bb.1:
	li	a4, 0
	j	.LBB0_3
.LBB0_2:
	seqz	a4, a4
	li	a5, 1
	slli	a4, a4, 63
	sllw	a5, a5, a1
	srai	a4, a4, 63
	add	a4, a5, a4
.LBB0_3:
	add	a3, a4, a3
	sraw	a1, a3, a1
	xor	a1, a1, a0
	sub	a1, a1, a0
	sw	a1, 0(a2)
	.cfi_def_cfa sp, 16
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	libdivide_s32_branchfree_do, .Lfunc_end0-libdivide_s32_branchfree_do
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
