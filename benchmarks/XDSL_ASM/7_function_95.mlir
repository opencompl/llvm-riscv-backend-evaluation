.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    mv t2, a2
    div t3, t0, t0
    xor t0, t0, t3
    sra t1, t1, t2
    divu t0, t0, t1
    zext.w t0, t0
    mv a0, t0
    ret
