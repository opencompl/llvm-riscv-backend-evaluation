.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t0, a1
    mv t3, a2
    zext.w t1, t2
    srl t0, t1, t0
    srl t1, t1, t0
    zext.w t2, t2
    xor t2, t2, t3
    rem t0, t0, t2
    or t0, t0, t1
    mv a0, t0
    ret
