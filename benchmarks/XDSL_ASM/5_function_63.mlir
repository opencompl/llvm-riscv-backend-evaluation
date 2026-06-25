.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t0, a1
    mv t1, a2
    xor t0, t0, t2
    zext.w t1, t1
    div t0, t0, t1
    mv a0, t0
    ret
