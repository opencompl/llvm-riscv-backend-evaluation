.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t3, a1
    mv t1, a2
    and t0, t2, t2
    sext.w t3, t3
    divu t2, t2, t3
    and t1, t1, t2
    sra t1, t1, t2
    divu t2, t2, t1
    sra t0, t0, t2
    div t0, t0, t1
    mv a0, t0
    ret
