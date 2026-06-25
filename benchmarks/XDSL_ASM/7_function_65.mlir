.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    mv t1, a2
    sext.w t0, t0
    and t0, t2, t0
    and t2, t2, t0
    div t2, t0, t2
    sra t0, t0, t2
    rem t0, t0, t1
    mv a0, t0
    ret
