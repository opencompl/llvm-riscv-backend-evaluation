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
	mv	a3, a0
	divu	a0, a0, a1
	or	a3, a3, a0
	xor	a3, a3, a2
	srl	a4, a0, a2
	andi	a1, a3, 1
	bge	a4, a3, .LBB0_3
# %bb.1:
	beqz	a1, .LBB0_4
.LBB0_2:
	ret
.LBB0_3:
	mv	a0, a3
	bnez	a1, .LBB0_2
.LBB0_4:
	mv	a0, a2
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
