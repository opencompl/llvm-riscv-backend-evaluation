.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t3, a1
    mv t2, a2
    zext.w t0, t1
    rem t2, t0, t2
    or t2, t2, t3
    sext.w t1, t1
    and t1, t1, t2
    divu t0, t0, t1
    mv a0, t0
    ret
