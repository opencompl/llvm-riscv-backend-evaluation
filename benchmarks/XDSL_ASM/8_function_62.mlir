.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t1, a1
    mv t0, a2
    zext.w t2, t2
    divu t1, t1, t0
    div t1, t1, t0
    xor t1, t1, t2
    sext.w t2, t0
    sra t1, t1, t2
    and t0, t0, t1
    mv a0, t0
    ret
