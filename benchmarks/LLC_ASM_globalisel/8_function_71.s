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
	bge	a1, a0, .LBB0_4
# %bb.1:
	andi	a1, a0, 1
	beqz	a1, .LBB0_5
.LBB0_2:
	beqz	a1, .LBB0_6
.LBB0_3:
	ret
.LBB0_4:
	mv	a0, a2
	andi	a1, a2, 1
	bnez	a1, .LBB0_2
.LBB0_5:
	srl	a2, a3, a0
	bnez	a1, .LBB0_3
.LBB0_6:
	mv	a0, a2
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
