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
	rem	a3, a1, a1
	andi	a4, a2, 1
	mv	a2, a3
	bnez	a4, .LBB0_2
# %bb.1:
	mv	a2, a1
.LBB0_2:
	andi	a0, a0, 1
	bnez	a0, .LBB0_4
# %bb.3:
	mv	a1, a2
.LBB0_4:
	rem	a0, a1, a3
	sext.w	a0, a0
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
