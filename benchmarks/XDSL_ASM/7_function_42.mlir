.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t2, a1
    mv t3, a2
    xor t0, t1, t1
    sra t3, t2, t3
    sra t0, t0, t3
    xor t1, t1, t2
    sra t0, t0, t1
    zext.w t0, t0
    mv a0, t0
    ret
