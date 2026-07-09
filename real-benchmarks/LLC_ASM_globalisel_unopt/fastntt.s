	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	fastNTT                         # -- Begin function fastNTT
	.p2align	2
	.type	fastNTT,@function
fastNTT:                                # @fastNTT
	.cfi_startproc
# %bb.0:
	li	a5, 1
	bge	a5, a1, .LBB0_18
# %bb.1:                                # %.lr.ph.preheader.lr.ph
	beqz	a4, .LBB0_3
# %bb.2:                                # %.lr.ph.preheader.lr.ph
	mv	a6, a1
	j	.LBB0_4
.LBB0_3:
	li	a6, 2
.LBB0_4:                                # %.lr.ph.preheader.lr.ph
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
	li	a7, 0
	li	t0, 3
	mv	t1, a1
	j	.LBB0_7
.LBB0_5:                                # %._crit_edge6
                                        #   in Loop: Header=BB0_7 Depth=1
	addi	a7, a7, 1
	beqz	a4, .LBB0_16
# %bb.6:                                #   in Loop: Header=BB0_7 Depth=1
	srli	t2, t2, 63
	add	a6, a6, t2
	srai	a6, a6, 1
.LBB0_7:                                # %.lr.ph.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
                                        #     Child Loop BB0_13 Depth 2
                                        #       Child Loop BB0_15 Depth 3
	srai	t2, t1, 63
	srli	t2, t2, 63
	add	t1, t1, t2
	srai	t1, t1, 1
	li	t2, -1
	mv	t3, a1
.LBB0_8:                                # %.lr.ph
                                        #   Parent Loop BB0_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	t4, t3
	srli	t3, t3, 1
	addi	t2, t2, 1
	bltu	t0, t4, .LBB0_8
# %bb.9:                                # %._crit_edge
                                        #   in Loop: Header=BB0_7 Depth=1
	bltu	t2, a7, .LBB0_17
# %bb.10:                               # %.preheader3
                                        #   in Loop: Header=BB0_7 Depth=1
	div	t3, a1, a6
	srai	t2, a6, 63
	blez	t3, .LBB0_5
# %bb.11:                               # %.preheader.lr.ph
                                        #   in Loop: Header=BB0_7 Depth=1
	li	t4, 0
	srli	t5, t2, 63
	add	t6, a6, t5
	sh3add	t5, t1, a3
	srai	t6, t6, 1
	slli	s1, t1, 4
	mv	s2, a0
	j	.LBB0_13
.LBB0_12:                               # %._crit_edge5
                                        #   in Loop: Header=BB0_13 Depth=2
	addi	t4, t4, 1
	sh3add	s2, a6, s2
	bge	t4, t3, .LBB0_5
.LBB0_13:                               # %.preheader
                                        #   Parent Loop BB0_7 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_15 Depth 3
	bge	a5, a6, .LBB0_12
# %bb.14:                               # %.lr.ph4
                                        #   in Loop: Header=BB0_13 Depth=2
	li	s3, 0
	mv	s4, s2
	mv	s5, t5
.LBB0_15:                               #   Parent Loop BB0_7 Depth=1
                                        #     Parent Loop BB0_13 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	sh3add	s6, t6, s4
	ld	s7, 0(s5)
	ld	s8, 0(s6)
	ld	s9, 0(s4)
	mul	s7, s7, s8
	rem	s7, s7, a2
	add	s8, s7, s9
	rem	s8, s8, a2
	add	s9, s9, a2
	sub	s7, s9, s7
	rem	s7, s7, a2
	sd	s8, 0(s4)
	sd	s7, 0(s6)
	addi	s3, s3, 1
	add	s5, s5, s1
	addi	s4, s4, 8
	blt	s3, t6, .LBB0_15
	j	.LBB0_12
.LBB0_16:                               #   in Loop: Header=BB0_7 Depth=1
	slli	a6, a6, 1
	j	.LBB0_7
.LBB0_17:
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
.LBB0_18:                               # %._crit_edge.thread
	ret
.Lfunc_end0:
	.size	fastNTT, .Lfunc_end0-fastNTT
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
