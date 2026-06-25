.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t4, a1
    mv t2, a2
    div t0, t3, t4
    zext.w t1, t3
    or t3, t3, t4
    remu t2, t2, t3
    div t1, t1, t2
    rem t0, t0, t1
    mv a0, t0
    ret
