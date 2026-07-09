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
	beqz	a1, .LBB0_4
# %bb.1:
	zext.w	a4, a0
	zext.w	a5, a1
	srai	a6, a0, 32
	mul	a7, a5, a4
	mul	a5, a5, a6
	srai	a1, a1, 32
	mul	a4, a1, a4
	mul	a1, a1, a6
	srli	a6, a7, 32
	add	a5, a6, a5
	srai	a6, a5, 32
	add.uw	a4, a5, a4
	add	a1, a6, a1
	srai	a4, a4, 32
	andi	a5, a2, 64
	add	a1, a1, a4
	beqz	a5, .LBB0_3
# %bb.2:
	sext.b	a4, a2
	srai	a4, a4, 7
	xor	a0, a0, a4
	sub	a4, a4, a1
	sub	a1, a0, a4
.LBB0_3:
	sra	a0, a1, a2
	srli	a1, a0, 63
	add	a0, a1, a0
	j	.LBB0_8
.LBB0_4:
	bltz	a0, .LBB0_6
# %bb.5:
	li	a1, 0
	j	.LBB0_7
.LBB0_6:
	bset	a1, zero, a2
	addi	a1, a1, -1
.LBB0_7:
	add	a0, a1, a0
	sext.b	a1, a2
	sra	a0, a0, a2
	srai	a1, a1, 7
	xor	a0, a0, a1
	sub	a0, a0, a1
.LBB0_8:
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
