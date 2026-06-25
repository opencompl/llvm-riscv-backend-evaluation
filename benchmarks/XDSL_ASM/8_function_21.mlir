.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t2, a1
    mv t0, a2
    zext.w t3, t2
    rem t1, t1, t3
    divu t0, t0, t2
    and t0, t0, t1
    sext.w t0, t0
    mv a0, t0
    ret
