.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t2, a1
    mv t0, a2
    sra t2, t2, t1
    rem t1, t1, t2
    or t0, t0, t0
    and t0, t0, t1
    sext.w t0, t0
    mv a0, t0
    ret
