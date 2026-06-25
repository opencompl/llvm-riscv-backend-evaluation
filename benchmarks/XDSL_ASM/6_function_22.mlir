.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t2, a1
    mv t0, a2
    or t0, t0, t2
    rem t0, t1, t0
    rem t0, t0, t1
    zext.w t0, t0
    mv a0, t0
    ret
