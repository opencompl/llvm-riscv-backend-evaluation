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
	sext.w	a3, a2
	mv	a2, a3
	bne	a3, a0, .LBB0_3
# %bb.1:
	andi	a1, a1, 1
	beqz	a1, .LBB0_4
.LBB0_2:
	srl	a0, a0, a2
	ret
.LBB0_3:
	mv	a2, a0
	andi	a1, a1, 1
	bnez	a1, .LBB0_2
.LBB0_4:
	srl	a2, a0, a3
	srl	a0, a0, a2
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
