.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    mv t1, a2
    xor t3, t0, t0
    rem t0, t0, t3
    zext.w t1, t1
    and t1, t1, t2
    srl t0, t0, t1
    mv a0, t0
    ret
