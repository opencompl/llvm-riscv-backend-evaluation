.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    mv t1, a2
    srl t1, t1, t0
    or t1, t1, t2
    sra t0, t0, t1
    zext.w t0, t0
    mv a0, t0
    ret
