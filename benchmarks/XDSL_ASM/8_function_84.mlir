.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    sext.w t1, t0
    zext.w t2, t2
    rem t0, t0, t2
    sext.w t0, t0
    and t0, t0, t1
    mv a0, t0
    ret
