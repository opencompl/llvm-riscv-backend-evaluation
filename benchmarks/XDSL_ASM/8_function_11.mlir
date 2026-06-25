.text
.globl func0
.p2align 2
func0:
    mv t2, a0
    mv t1, a1
    mv t3, a2
    mv t0, a3
    srl t1, t2, t1
    sra t3, t2, t3
    remu t2, t2, t3
    remu t2, t2, t1
    div t1, t1, t2
    zext.w t0, t0
    and t0, t0, t1
    mv a0, t0
    ret
