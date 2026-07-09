	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	libdivide_u32_do_raw            # -- Begin function libdivide_u32_do_raw
	.p2align	2
	.type	libdivide_u32_do_raw,@function
libdivide_u32_do_raw:                   # @libdivide_u32_do_raw
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
	beqz	a4, .LBB0_4
# %bb.1:
	zext.w	a4, a0
	zext.w	a1, a1
	mul	a1, a1, a4
	andi	a4, a2, 64
	srli	a1, a1, 32
	bnez	a4, .LBB0_3
# %bb.2:
	srlw	a0, a1, a2
	j	.LBB0_5
.LBB0_3:
	sub	a0, a0, a1
	srliw	a0, a0, 1
	add	a0, a0, a1
.LBB0_4:
	srlw	a0, a0, a2
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
	.size	libdivide_u32_do_raw, .Lfunc_end0-libdivide_u32_do_raw
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
