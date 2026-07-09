	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	libdivide_s32_recover           # -- Begin function libdivide_s32_recover
	.p2align	2
	.type	libdivide_s32_recover,@function
libdivide_s32_recover:                  # @libdivide_s32_recover
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
	lw	a2, 0(a0)
	lbu	a0, 4(a0)
	beqz	a2, .LBB0_3
# %bb.1:
	andi	a3, a0, 64
	beqz	a3, .LBB0_5
# %bb.2:
	slti	a3, a2, 1
	j	.LBB0_6
.LBB0_3:
	li	a2, 1
	sext.b	a3, a0
	sllw	a0, a2, a0
	bgez	a3, .LBB0_11
# %bb.4:
	neg	a0, a0
	j	.LBB0_11
.LBB0_5:
	slti	a3, a2, 0
	xori	a3, a3, 1
.LBB0_6:
	andi	a4, a3, 1
	andi	a3, a0, 31
	bnez	a4, .LBB0_8
# %bb.7:
	neg	a2, a2
.LBB0_8:
	ori	a3, a3, 32
	zext.w	a2, a2
	bset	a3, zero, a3
	divu	a2, a3, a2
	sext.b	a0, a0
	bltz	a0, .LBB0_10
# %bb.9:
	addi	a0, a2, 1
	j	.LBB0_11
.LBB0_10:
	not	a0, a2
.LBB0_11:
	sw	a0, 0(a1)
	.cfi_def_cfa sp, 16
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	libdivide_s32_recover, .Lfunc_end0-libdivide_s32_recover
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
