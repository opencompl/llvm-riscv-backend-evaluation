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
	rem	a5, a2, a0
	and	a4, a0, a1
	andi	a6, a3, 1
	xor	a3, a4, a5
	bnez	a6, .LBB0_2
# %bb.1:
	xor	a4, a2, a1
.LBB0_2:
	rem	a1, a3, a4
	srl	a0, a1, a0
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
