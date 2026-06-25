.text
.globl func0
.p2align 2
func0:
    mv t4, a0
    mv t2, a1
    mv t1, a2
    zext.w t4, t4
    remu t0, t4, t2
    remu t3, t2, t4
    div t1, t1, t4
    and t1, t1, t3
    xor t1, t1, t2
    sra t0, t0, t1
    mv a0, t0
    ret
