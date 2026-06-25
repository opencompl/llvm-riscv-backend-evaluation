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
	andi	a5, a3, 1
	srl	a1, a2, a1
	sra	a1, a4, a1
	mv	a3, a2
	bnez	a5, .LBB0_2
# %bb.1:
	mv	a3, a0
.LBB0_2:
	sra	a0, a3, a1
	or	a0, a1, a0
	remu	a1, a2, a0
	sltu	a0, a0, a1
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
