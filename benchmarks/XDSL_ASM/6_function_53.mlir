.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    mv t1, a2
    zext.w t2, t2
    xor t1, t1, t1
    div t3, t2, t1
    remu t0, t0, t3
    srl t1, t1, t2
    divu t0, t0, t1
    mv a0, t0
    ret
