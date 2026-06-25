	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zmmul1p0_zba1p0_zbb1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	mv	a3, a2
	beq	a0, a1, .LBB0_2
# %bb.1:
	divu	a3, a2, a1
.LBB0_2:
	or	a4, a0, a2
	mv	a2, a3
	bltu	a1, a4, .LBB0_4
# %bb.3:
	mv	a2, a0
.LBB0_4:
	sra	a0, a3, a2
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
