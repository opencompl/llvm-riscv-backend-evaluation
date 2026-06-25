.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    div t2, t0, t0
    divu t0, t0, t2
    rem t0, t0, t1
    sext.w t0, t0
    zext.w t0, t0
    mv a0, t0
    ret
