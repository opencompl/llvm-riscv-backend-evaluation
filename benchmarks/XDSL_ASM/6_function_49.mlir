.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t0, a1
    sext.w t1, t2
    remu t1, t1, t2
    zext.w t0, t0
    or t0, t0, t1
    mv a0, t0
    ret
