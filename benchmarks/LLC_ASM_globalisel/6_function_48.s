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
	rem	a1, a2, a2
	andi	a3, a0, 1
	mv	a0, a1
	beqz	a3, .LBB0_3
# %bb.1:
	andi	a2, a0, 1
	beqz	a2, .LBB0_4
.LBB0_2:
	mv	a0, a1
	ret
.LBB0_3:
	rem	a0, a2, a1
	andi	a2, a0, 1
	bnez	a2, .LBB0_2
.LBB0_4:
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
