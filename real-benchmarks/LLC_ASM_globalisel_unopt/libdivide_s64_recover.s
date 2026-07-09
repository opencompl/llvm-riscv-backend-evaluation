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
	beqz	a2, .LBB0_3
# %bb.1:
	andi	a3, a0, 64
	beqz	a3, .LBB0_4
# %bb.2:
	slti	a3, a2, 1
	andi	a3, a3, 1
	beqz	a3, .LBB0_5
	j	.LBB0_6
.LBB0_3:
	bset	a3, zero, a0
	j	.LBB0_12
.LBB0_4:
	slti	a3, a2, 0
	xori	a3, a3, 1
	andi	a3, a3, 1
	bnez	a3, .LBB0_6
.LBB0_5:
	neg	a2, a2
.LBB0_6:
	bset	a4, zero, a0
	li	a3, 0
	bgeu	a4, a2, .LBB0_12
# %bb.7:
	clz	a3, a2
	sll	a2, a2, a3
	sll	a4, a4, a3
	srli	a3, a2, 32
	divu	a6, a4, a3
	mul	t0, a6, a3
	zext.w	a5, a2
	mul	a7, a6, a5
	sub	t0, a4, t0
	slli	t0, t0, 32
	bgeu	t0, a7, .LBB0_9
# %bb.8:
	sub	a7, a7, t0
	sltu	a7, a2, a7
	slli	a7, a7, 63
	srai	a7, a7, 63
	add	a6, a7, a6
	addi	a6, a6, -1
.LBB0_9:
	zext.w	a6, a6
	mul	a7, a2, a6
	slli	a4, a4, 32
	sub	a7, a4, a7
	divu	a4, a7, a3
	mul	a3, a4, a3
	mul	a5, a4, a5
	sub	a7, a7, a3
	slli	a7, a7, 32
	li	a3, 1
	bgeu	a7, a5, .LBB0_11
# %bb.10:
	sub	a5, a5, a7
	sltu	a2, a2, a5
	slli	a2, a2, 63
	srai	a2, a2, 63
	add	a2, a2, a4
	addi	a4, a2, -1
.LBB0_11:
	zext.w	a2, a4
	pack	a3, a3, a6
	add	a3, a3, a2
.LBB0_12:
	sext.b	a0, a0
	bgez	a0, .LBB0_14
# %bb.13:
	neg	a3, a3
.LBB0_14:
	sd	a3, 0(a1)
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
