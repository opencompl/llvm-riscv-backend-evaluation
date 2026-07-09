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
	lwu	a5, -60(a4)
	lwu	a6, -8(a4)
	lw	a7, -64(a4)
	lw	t0, -28(a4)
	roriw	t1, a5, 7
	roriw	t2, a5, 18
	srli	a5, a5, 3
	xor	t1, t1, t2
	roriw	t2, a6, 17
	roriw	t3, a6, 19
	xor	a5, t1, a5
	xor	t1, t2, t3
	add	a5, a5, a7
	srli	a6, a6, 10
	xor	a6, t1, a6
	add	a5, a5, t0
	add	a5, a5, a6
	sw	a5, 0(a4)
	addi	a4, a4, 4
	bne	a4, a1, .LBB0_1
# %bb.2:
	lw	t3, 0(a0)
	lw	t2, 4(a0)
	lw	t1, 8(a0)
	lw	t0, 12(a0)
	lw	a5, 24(a0)
	lw	a4, 28(a0)
	lw	a7, 16(a0)
	lw	a6, 20(a0)
	mv	s3, t3
	mv	s2, t2
	mv	s1, t1
	mv	s4, t0
	mv	s5, a4
	mv	s7, a5
	mv	s8, a6
	mv	s6, a7
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	mv	t6, s6
	mv	t5, s8
	mv	t4, s7
	mv	s6, s4
	lw	s7, 0(a2)
	roriw	s4, t6, 6
	roriw	s8, t6, 11
	roriw	s9, t6, 25
	xor	s4, s4, s8
	and	s8, t5, t6
	xor	s4, s4, s9
	andn	s9, t4, t6
	or	s8, s9, s8
	add	s4, s5, s4
	lw	s5, 0(a3)
	add	s8, s4, s8
	mv	s4, s1
	mv	s1, s2
	mv	s2, s3
	add	s7, s8, s7
	roriw	s3, s3, 2
	roriw	s8, s2, 13
	add	s5, s7, s5
	xor	s3, s3, s8
	roriw	s7, s2, 22
	xor	s8, s1, s4
	and	s8, s2, s8
	and	s9, s1, s4
	xor	s3, s3, s7
	xor	s7, s8, s9
	add	s6, s5, s6
	add	s3, s3, s7
	add	s3, s3, s5
	addi	a3, a3, 4
	addi	a2, a2, 4
	mv	s5, t4
	mv	s7, t5
	mv	s8, t6
	bne	a3, a1, .LBB0_3
# %bb.4:
	add	t3, s3, t3
	add	t2, s2, t2
	add	t1, s1, t1
	add	t0, s4, t0
	sw	t3, 0(a0)
	sw	t2, 4(a0)
	sw	t1, 8(a0)
	sw	t0, 12(a0)
	add	a7, s6, a7
	add	a6, t6, a6
	add	a5, t5, a5
	add	a4, t4, a4
	sw	a7, 16(a0)
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
	addi	sp, sp, 96
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	sha256_block, .Lfunc_end0-sha256_block
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
