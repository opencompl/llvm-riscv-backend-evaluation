.text
.globl func0
.p2align 2
func0:
    mv t0, a0
    mv t2, a1
    zext.w t1, t0
    sra t1, t1, t2
    sext.w t1, t1
    zext.w t1, t1
    remu t0, t0, t1
    mv a0, t0
    ret
