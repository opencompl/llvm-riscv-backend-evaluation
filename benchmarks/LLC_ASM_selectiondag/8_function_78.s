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
	andi	a4, a3, 1
	mv	a3, a1
	bnez	a4, .LBB0_2
# %bb.1:
	mv	a3, a2
.LBB0_2:
	zext.w	a0, a0
	or	a1, a1, a2
	bnez	a4, .LBB0_4
# %bb.3:
	mv	a2, a3
.LBB0_4:
	div	a3, a3, a0
	srl	a2, a2, a3
	remu	a1, a1, a2
	divu	a0, a0, a1
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
