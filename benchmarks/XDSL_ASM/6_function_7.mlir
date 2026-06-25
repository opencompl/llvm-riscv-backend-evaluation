.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    mv t2, a2
    remu t0, t0, t1
    divu t0, t0, t2
    zext.w t0, t0
    sra t0, t0, t1
    mv a0, t0
    ret
