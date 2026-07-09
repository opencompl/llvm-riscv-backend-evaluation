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
	sext.w	a4, a1
	seqz	a1, a4
	xori	a1, a1, 1
	zext.h	a5, a1
	andi	a1, a2, 31
	beqz	a5, .LBB0_4
# %bb.1:
	sext.w	a5, a0
	mul	a4, a4, a5
	andi	a5, a2, 64
	li	a6, 1
	czero.nez	a5, a6, a5
	srli	a4, a4, 32
	bnez	a5, .LBB0_3
# %bb.2:
	slli	a2, a2, 56
	srai	a2, a2, 63
	sext.b	a2, a2
	xor	a0, a0, a2
	sub	a2, a2, a4
	sub	a4, a0, a2
.LBB0_3:
	sraw	a0, a4, a1
	srliw	a1, a0, 31
	add	a0, a1, a0
	j	.LBB0_5
.LBB0_4:
	bset	a4, zero, a1
	srliw	a5, a0, 31
	addi	a4, a4, -1
	zext.h	a5, a5
	slli	a2, a2, 56
	czero.eqz	a4, a4, a5
	srai	a2, a2, 63
	add	a0, a4, a0
	sext.b	a2, a2
	sraw	a0, a0, a1
	xor	a0, a0, a2
	sub	a0, a0, a2
.LBB0_5:
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
