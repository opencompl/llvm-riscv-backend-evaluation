	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	libdivide_s32_do_raw            # -- Begin function libdivide_s32_do_raw
	.p2align	2
	.type	libdivide_s32_do_raw,@function
libdivide_s32_do_raw:                   # @libdivide_s32_do_raw
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
	sext.w	a1, a1
	beqz	a1, .LBB0_4
# %bb.1:
	sext.w	a4, a0
	mul	a1, a1, a4
	andi	a4, a2, 64
	srli	a1, a1, 32
	beqz	a4, .LBB0_3
# %bb.2:
	sext.b	a4, a2
	srai	a4, a4, 7
	xor	a0, a0, a4
	sub	a0, a0, a4
	add	a1, a0, a1
.LBB0_3:
	sraw	a0, a1, a2
	srliw	a1, a0, 31
	add	a0, a1, a0
	j	.LBB0_8
.LBB0_4:
	sext.b	a1, a2
	sext.w	a4, a0
	srai	a1, a1, 7
	bltz	a4, .LBB0_6
# %bb.5:
	li	a4, 0
	j	.LBB0_7
.LBB0_6:
	li	a4, -1
	sllw	a4, a4, a2
	not	a4, a4
.LBB0_7:
	add	a0, a4, a0
	sraw	a0, a0, a2
	xor	a0, a0, a1
	sub	a0, a0, a1
.LBB0_8:
	sw	a0, 0(a3)
	.cfi_def_cfa sp, 16
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	libdivide_s32_do_raw, .Lfunc_end0-libdivide_s32_do_raw
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
