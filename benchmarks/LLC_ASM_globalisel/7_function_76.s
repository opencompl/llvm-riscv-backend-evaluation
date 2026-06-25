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
	divu	a4, a0, a1
	divu	a5, a4, a4
	divu	a2, a5, a2
	andi	a3, a3, 1
	or	a0, a2, a0
	bnez	a3, .LBB0_2
# %bb.1:
	mv	a4, a1
.LBB0_2:
	or	a0, a0, a4
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
