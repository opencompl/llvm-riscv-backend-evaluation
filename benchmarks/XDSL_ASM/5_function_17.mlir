.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t1, a1
    divu t2, t0, t0
    or t0, t0, t2
    zext.w t1, t1
    sra t0, t0, t1
    mv a0, t0
    ret
