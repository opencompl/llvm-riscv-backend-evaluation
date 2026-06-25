.text
.globl func0
.p2align 2
func0:
    mv t1, a0
    mv t2, a1
    zext.w t0, t1
    zext.w t3, t1
    sra t0, t0, t3
    srl t0, t0, t2
    and t0, t0, t1
    mv a0, t0
    ret
