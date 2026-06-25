.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t0, a1
    mv t2, a2
    zext.w t2, t2
    sra t0, t0, t2
    xor t0, t0, t1
    zext.w t0, t0
    mv a0, t0
    ret
