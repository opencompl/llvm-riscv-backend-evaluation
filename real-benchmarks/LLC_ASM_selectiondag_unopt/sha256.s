	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	sha256_block                    # -- Begin function sha256_block
	.p2align	2
	.type	sha256_block,@function
sha256_block:                           # @sha256_block
	.cfi_startproc
# %bb.0:                                # %.preheader.preheader
	addi	sp, sp, -96
	.cfi_def_cfa_offset 96
	sd	ra, 88(sp)                      # 8-byte Folded Spill
	sd	s0, 80(sp)                      # 8-byte Folded Spill
	sd	s1, 72(sp)                      # 8-byte Folded Spill
	sd	s2, 64(sp)                      # 8-byte Folded Spill
	sd	s3, 56(sp)                      # 8-byte Folded Spill
	sd	s4, 48(sp)                      # 8-byte Folded Spill
	sd	s5, 40(sp)                      # 8-byte Folded Spill
	sd	s6, 32(sp)                      # 8-byte Folded Spill
	sd	s7, 24(sp)                      # 8-byte Folded Spill
	sd	s8, 16(sp)                      # 8-byte Folded Spill
	sd	s9, 8(sp)                       # 8-byte Folded Spill
	sd	s10, 0(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	.cfi_offset s7, -72
	.cfi_offset s8, -80
	.cfi_offset s9, -88
	.cfi_offset s10, -96
	addi	s0, sp, 96
	.cfi_def_cfa s0, 0
	lw	a4, 0(a1)
	sw	a4, 0(a3)
	lw	a4, 4(a1)
	sw	a4, 4(a3)
	lw	a4, 8(a1)
	sw	a4, 8(a3)
	lw	a4, 12(a1)
	sw	a4, 12(a3)
	lw	a4, 16(a1)
	sw	a4, 16(a3)
	lw	a4, 20(a1)
	sw	a4, 20(a3)
	lw	a4, 24(a1)
	sw	a4, 24(a3)
	lw	a4, 28(a1)
	sw	a4, 28(a3)
	lw	a4, 32(a1)
	sw	a4, 32(a3)
	lw	a4, 36(a1)
	sw	a4, 36(a3)
	lw	a4, 40(a1)
	sw	a4, 40(a3)
	lw	a4, 44(a1)
	sw	a4, 44(a3)
	lw	a4, 48(a1)
	sw	a4, 48(a3)
	lw	a4, 52(a1)
	sw	a4, 52(a3)
	lw	a4, 56(a1)
	sw	a4, 56(a3)
	lw	a1, 60(a1)
	sw	a1, 60(a3)
	addi	a4, a3, 64
	addi	a1, a3, 256
.LBB0_1:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	lw	a5, -60(a4)
	lw	a6, -8(a4)
	lw	a7, -64(a4)
	lw	t0, -28(a4)
	roriw	t1, a5, 7
	roriw	t2, a5, 18
	srliw	a5, a5, 3
	roriw	t3, a6, 17
	xor	t1, t1, t2
	roriw	t2, a6, 19
	xor	t2, t3, t2
	xor	a5, t1, a5
	add	a7, a7, t0
	srliw	a6, a6, 10
	xor	a6, t2, a6
	add	a5, a5, a7
	add	a5, a5, a6
	sw	a5, 0(a4)
	addi	a4, a4, 4
	xor	a5, a4, a1
	seqz	a5, a5
	xori	a5, a5, 1
	zext.h	a5, a5
	bnez	a5, .LBB0_1
# %bb.2:
	lw	t3, 0(a0)
	lw	t2, 4(a0)
	lw	t1, 8(a0)
	lw	a7, 12(a0)
	lw	a5, 24(a0)
	lw	a4, 28(a0)
	lw	t0, 16(a0)
	lw	a6, 20(a0)
	mv	s4, t3
	mv	s1, t2
	mv	t6, t1
	mv	s3, a7
	mv	s6, a4
	mv	s7, a5
	mv	s8, a6
	mv	s5, t0
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	mv	t5, s5
	mv	t4, s8
	roriw	s5, s5, 6
	roriw	s8, t5, 11
	mv	s2, s7
	xor	s5, s5, s8
	roriw	s7, t5, 25
	and	s8, t4, t5
	andn	s9, s2, t5
	lw	s10, 0(a2)
	or	s8, s9, s8
	lw	s9, 0(a3)
	xor	s5, s5, s7
	add	s6, s6, s8
	add	s5, s6, s5
	add	s5, s5, s10
	add	s9, s5, s9
	add	s5, s9, s3
	mv	s3, t6
	mv	t6, s1
	mv	s1, s4
	roriw	s4, s4, 2
	roriw	s6, s1, 13
	xor	s4, s4, s6
	roriw	s6, s1, 22
	xor	s4, s4, s6
	xor	s6, t6, s3
	and	s6, s1, s6
	and	s7, t6, s3
	xor	s6, s6, s7
	addi	a3, a3, 4
	add	s4, s4, s6
	xor	s6, a3, a1
	add	s4, s4, s9
	seqz	s6, s6
	addi	a2, a2, 4
	xori	s6, s6, 1
	zext.h	s9, s6
	mv	s6, s2
	mv	s7, t4
	mv	s8, t5
	bnez	s9, .LBB0_3
# %bb.4:
	add	t3, s4, t3
	add	t2, s1, t2
	add	t1, t6, t1
	add	a7, s3, a7
	sw	t3, 0(a0)
	sw	t2, 4(a0)
	sw	t1, 8(a0)
	sw	a7, 12(a0)
	add	t0, s5, t0
	add	a6, t5, a6
	add	a5, t4, a5
	add	a4, s2, a4
	sw	t0, 16(a0)
	sw	a6, 20(a0)
	sw	a5, 24(a0)
	sw	a4, 28(a0)
	.cfi_def_cfa sp, 96
	ld	ra, 88(sp)                      # 8-byte Folded Reload
	ld	s0, 80(sp)                      # 8-byte Folded Reload
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	ld	s2, 64(sp)                      # 8-byte Folded Reload
	ld	s3, 56(sp)                      # 8-byte Folded Reload
	ld	s4, 48(sp)                      # 8-byte Folded Reload
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	ld	s6, 32(sp)                      # 8-byte Folded Reload
	ld	s7, 24(sp)                      # 8-byte Folded Reload
	ld	s8, 16(sp)                      # 8-byte Folded Reload
	ld	s9, 8(sp)                       # 8-byte Folded Reload
	ld	s10, 0(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	.cfi_restore s4
	.cfi_restore s5
	.cfi_restore s6
	.cfi_restore s7
	.cfi_restore s8
	.cfi_restore s9
	.cfi_restore s10
	addi	sp, sp, 96
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	sha256_block, .Lfunc_end0-sha256_block
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
