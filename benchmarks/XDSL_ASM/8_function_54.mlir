.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    mv t1, a2
    or t0, t0, t0
    zext.w t3, t1
    srl t2, t2, t3
    sext.w t1, t1
    remu t2, t2, t1
    and t1, t1, t2
    rem t0, t0, t1
    mv a0, t0
    ret
