.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t0, a1
    mv t2, a2
    rem t1, t3, t0
    and t1, t1, t3
    and t0, t0, t2
    or t0, t0, t1
    sext.w t0, t0
    mv a0, t0
    ret
