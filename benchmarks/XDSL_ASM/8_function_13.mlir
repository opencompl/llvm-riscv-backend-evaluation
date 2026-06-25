.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t0, a1
    remu t3, t2, t2
    sext.w t1, t3
    or t0, t0, t3
    and t0, t0, t2
    xor t0, t0, t1
    zext.w t0, t0
    mv a0, t0
    ret
