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
	slti	a5, a1, 2
	xori	a5, a5, 1
	xori	a5, a5, 1
	zext.h	a5, a5
	bnez	a5, .LBB0_15
# %bb.1:                                # %.lr.ph.preheader.lr.ph
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
	li	a7, 1
	li	a6, 2
	czero.nez	a4, a7, a4
	sub	a7, a1, a6
	czero.nez	a7, a7, a4
	addi	a7, a7, 2
	mv	t0, a1
	j	.LBB0_4
.LBB0_2:                                # %._crit_edge6
                                        #   in Loop: Header=BB0_4 Depth=1
	addi	a5, a5, 1
	bnez	a4, .LBB0_13
# %bb.3:                                #   in Loop: Header=BB0_4 Depth=1
	div	a7, a7, a6
.LBB0_4:                                # %.lr.ph.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_10 Depth 2
                                        #       Child Loop BB0_12 Depth 3
	div	t0, t0, a6
	li	t1, -1
	mv	t2, a1
.LBB0_5:                                # %.lr.ph
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	sltiu	t3, t2, 4
	xori	t3, t3, 1
	srli	t2, t2, 1
	zext.h	t3, t3
	addi	t1, t1, 1
	bnez	t3, .LBB0_5
# %bb.6:                                # %._crit_edge
                                        #   in Loop: Header=BB0_4 Depth=1
	sltu	t1, t1, a5
	zext.h	t1, t1
	bnez	t1, .LBB0_14
# %bb.7:                                # %.preheader3
                                        #   in Loop: Header=BB0_4 Depth=1
	div	t1, a1, a7
	slti	t2, t1, 1
	zext.h	t2, t2
	bnez	t2, .LBB0_2
# %bb.8:                                # %.preheader.lr.ph
                                        #   in Loop: Header=BB0_4 Depth=1
	div	t3, a7, a6
	sh3add	t4, t0, a3
	slli	t5, t0, 4
	slti	s1, a7, 2
	slli	t6, a7, 3
	xori	s1, s1, 1
	xori	s2, s1, 1
	slli	s1, t3, 3
	zext.h	s2, s2
	mv	s3, a0
	j	.LBB0_10
.LBB0_9:                                # %._crit_edge5
                                        #   in Loop: Header=BB0_10 Depth=2
	addi	t2, t2, 1
	slt	s4, t2, t1
	zext.h	s4, s4
	add	s3, s3, t6
	beqz	s4, .LBB0_2
.LBB0_10:                               # %.preheader
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_12 Depth 3
	bnez	s2, .LBB0_9
# %bb.11:                               # %.lr.ph4
                                        #   in Loop: Header=BB0_10 Depth=2
	li	s4, 0
	mv	s5, s3
	mv	s6, t4
.LBB0_12:                               #   Parent Loop BB0_4 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	add	s7, s5, s1
	ld	s8, 0(s6)
	ld	s9, 0(s7)
	ld	s10, 0(s5)
	mul	s8, s8, s9
	rem	s8, s8, a2
	add	s9, s8, s10
	rem	s9, s9, a2
	add	s10, s10, a2
	sub	s8, s10, s8
	rem	s8, s8, a2
	addi	s4, s4, 1
	sd	s9, 0(s5)
	slt	s9, s4, t3
	sd	s8, 0(s7)
	zext.h	s7, s9
	add	s6, s6, t5
	addi	s5, s5, 8
	bnez	s7, .LBB0_12
	j	.LBB0_9
.LBB0_13:                               #   in Loop: Header=BB0_4 Depth=1
	slli	a7, a7, 1
	j	.LBB0_4
.LBB0_14:
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
.LBB0_15:                               # %._crit_edge.thread
	ret
.Lfunc_end0:
	.size	fastNTT, .Lfunc_end0-fastNTT
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
