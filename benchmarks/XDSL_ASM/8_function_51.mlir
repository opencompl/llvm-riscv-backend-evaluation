.text
.globl func0
.p2align 2
func0:
    mv t3, a0
    mv t0, a1
    mv t1, a2
    mv t2, a3
    sra t3, t3, t0
    and t0, t3, t3
    or t0, t0, t3
    xor t1, t1, t1
    zext.w t2, t2
    srl t1, t1, t2
    div t0, t0, t1
    mv a0, t0
    ret
