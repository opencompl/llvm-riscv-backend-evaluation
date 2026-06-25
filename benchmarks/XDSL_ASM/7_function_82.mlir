.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t0, a1
    mv t2, a2
    sext.w t2, t2
    sext.w t2, t2
    sra t0, t0, t2
    or t0, t0, t1
    mv a0, t0
    ret
