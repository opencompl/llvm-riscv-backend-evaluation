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
	sext.w	a3, a3
	divu	a3, a0, a3
	andi	a4, a2, 1
	and	a1, a1, a3
	mv	a2, a1
	bnez	a4, .LBB0_2
# %bb.1:
	mv	a2, a0
.LBB0_2:
	and	a1, a1, a2
	and	a0, a0, a1
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
