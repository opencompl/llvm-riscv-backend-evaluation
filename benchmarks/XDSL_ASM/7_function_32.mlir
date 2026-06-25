.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t2, a1
    mv t0, a2
    sext.w t3, t1
    sra t1, t1, t3
    zext.w t1, t1
    xor t0, t0, t2
    xor t0, t0, t1
    mv a0, t0
    ret
