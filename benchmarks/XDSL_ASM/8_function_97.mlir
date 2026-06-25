.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t3, a1
    mv t1, a2
    sext.w t2, t2
    xor t2, t3, t2
    zext.w t0, t1
    remu t0, t0, t3
    or t0, t0, t2
    sext.w t1, t1
    divu t0, t0, t1
    mv a0, t0
    ret
