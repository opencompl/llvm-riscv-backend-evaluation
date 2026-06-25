.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t2, a1
    mv t0, a2
    xor t2, t2, t1
    remu t2, t1, t2
    srl t1, t1, t2
    zext.w t0, t0
    and t0, t0, t1
    mv a0, t0
    ret
